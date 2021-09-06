module DT(
           input 	clk,
           input	reset,
           output	done,
           output	reg sti_rd,
           output 	reg [9:0] sti_addr,
           input	[15:0] sti_di,
           output	reg res_wr,
           output	reg res_rd,
           output 	reg [13:0] res_addr,
           output 	reg [7:0] res_do,
           input	[7:0] res_di
       );

wire initialize_done, fp_done, bp_done;

parameter init_p=0, fp_p=1, bp_p=2, done_p=3;
reg [1:0]state, nstate;

always @(*) 
begin
    case (state)
        init_p: nstate=(initialize_done)?fp_p:init_p;
        fp_p: nstate=(fp_done)?bp_p:fp_p;
        bp_p: nstate=(bp_done)?done_p:bp_p;
        done_p: nstate=done_p;
        default :nstate=init_p;
    endcase
end

always @(posedge clk or negedge reset) begin
    if (!reset)
        state=init_p;
    else
        state=nstate;
end

//initialize
wire sti_rd_init;
wire [9:0] sti_addr_init;
wire res_wr_init;
wire [13:0]res_addr_init;
wire [7:0]res_do_init;
initialize init (clk, reset, sti_rd_init, sti_addr_init, sti_di,
                res_wr_init, res_addr_init, res_do_init, initialize_done);

//forward pass
wire res_wr_fp, res_rd_fp;
wire [13:0] res_addr_fp;
wire [7:0] res_do_fp;
forward_pass fp (clk, reset, initialize_done, res_rd_fp, res_wr_fp,
                 res_addr_fp, res_do_fp, res_di, fp_done);

//backward_pass
wire res_wr_bp, res_rd_bp;
wire [13:0] res_addr_bp;
wire [7:0] res_do_bp;
backward_pass bp (clk, reset, fp_done, res_rd_bp, res_wr_bp,
                 res_addr_bp, res_do_bp, res_di, bp_done);

always @(*) begin
    case (state)
    init_p:begin
        sti_rd=sti_rd_init;
        sti_addr=sti_addr_init;
        res_wr=res_wr_init;
        res_rd=0;
        res_addr=res_addr_init;
        res_do=res_do_init;
    end
    fp_p:begin
        sti_rd=0;
        sti_addr=0;
        res_wr=res_wr_fp;
        res_rd=res_rd_fp;
        res_addr=res_addr_fp;
        res_do=res_do_fp;
    end
    bp_p:begin
        sti_rd=0;
        sti_addr=0;
        res_wr=res_wr_bp;
        res_rd=res_rd_bp;
        res_addr=res_addr_bp;
        res_do=res_do_bp;
    end
    done_p:begin
        sti_rd=0;
        sti_addr=0;
        res_wr=0;
        res_rd=0;
        res_addr=0;
        res_do=0;
    end
    default:begin
        sti_rd=0;
        sti_addr=0;
        res_wr=0;
        res_rd=0;
        res_addr=0;
        res_do=0;
    end   
    endcase
end

assign done=(state==done_p);

endmodule

module initialize (clk, rstn, sti_rd, sti_addr, sti_di, res_wr, res_addr, res_do, initialize_done);
input clk, rstn;
output reg sti_rd;
output reg [9:0] sti_addr;
input [15:0] sti_di;
output reg res_wr;
output reg [13:0]res_addr;
output reg [7:0]res_do;
output reg initialize_done;

parameter init=0, indicate_ROM=1, load_from_ROM=2, send_to_RAM_0=3, send_to_RAM=4, checkif_done=5, done=6;
reg [2:0]state, nstate;
reg [3:0]buf_state, buf_nstate;
reg [0:15]buff;

always @(*) 
begin
    case(state)
        init: nstate=indicate_ROM;
        indicate_ROM: nstate=load_from_ROM;
        load_from_ROM: nstate=send_to_RAM_0;
        send_to_RAM_0: nstate=send_to_RAM;
        send_to_RAM: nstate=(buf_state==4'b1111)?checkif_done:send_to_RAM;
        checkif_done: nstate=(sti_addr==1023)?done:indicate_ROM;
        done: nstate=done;
    endcase    
end

always @(posedge clk or negedge rstn) 
begin
    if(!rstn)
        state=init;
    else
        state=nstate;    
end

always @(*) 
begin
    case(state)
        init: begin
            // control signal 
            sti_rd=0;
            res_wr=0;
            initialize_done=0;
            res_do=0;
            buff=0;
        end
        indicate_ROM:begin
            sti_rd=1;
        end
        load_from_ROM:begin
            sti_rd=0;
            buff=sti_di;
        end
        send_to_RAM_0:begin
            res_wr=1;
            res_do={7'b0, buff[buf_state]};
        end
        send_to_RAM:begin
            res_wr=1;
            res_do={7'b0, buff[buf_state]};
        end
        checkif_done:begin
            res_wr=0;
        end
        done:begin
            sti_rd=0;
            res_wr=0;
            initialize_done=1;
        end

    endcase
end

// count 16 cycles for loading 16 pixel every time from ROM
always @(*) begin
    case (buf_state)
        15: buf_nstate=15;
        default :buf_nstate=buf_state+1;
    endcase
end

always @(posedge clk) begin
    case(state)
        send_to_RAM: buf_state<=buf_nstate;
        default: buf_state<=0;
    endcase
end
//------

// address to ROM & RAM control
always @(posedge clk)
begin
	case (state)
	init:
	begin
		sti_addr=0;
		res_addr=0;
	end
	send_to_RAM:
		res_addr=res_addr+1;
	checkif_done:
	begin
		if (sti_addr==1023)
                	sti_addr=1023;
            	else
                	sti_addr=sti_addr+1;
		res_addr=res_addr+1;
	end
	endcase
end

endmodule //init

module forward_pass(clk, rstn, initialize_done, res_rd, res_wr, res_addr, res_do, res_di, fp_done);
input clk, rstn, initialize_done;
input [7:0]	res_di;
output reg res_wr, res_rd, fp_done;
output reg [13:0] res_addr;
output reg [7:0] res_do;

parameter init=0, send_target_addr=1, check_target=2, send_NW=3, send_N_load_NW=4;
parameter send_NE_load_N=5, send_W_load_NE=6, load_W_find_min=7, check_RAM_addr=8, done=9;
parameter min_RAM_addr=129, MAX_RAM_addr=128*126+126;
reg[3:0]state, nstate;
reg [7:0] data;

always @(*)
begin
    case(state)
        init: nstate=(initialize_done)?send_target_addr:init;
        send_target_addr: nstate=check_target;
        check_target: nstate=(res_di==0)?check_RAM_addr:send_NW;
        send_NW: nstate=send_N_load_NW;
        send_N_load_NW: nstate=send_NE_load_N;
        send_NE_load_N: nstate=send_W_load_NE;
        send_W_load_NE: nstate=load_W_find_min;
        load_W_find_min: nstate=check_RAM_addr;
        check_RAM_addr: nstate=(res_addr>MAX_RAM_addr)?done:send_target_addr;
        done: nstate=done;
        default : nstate=init;
    endcase
end

always @(posedge clk or negedge rstn) 
begin
    if (!rstn)
        state=init;
    else
        state=nstate; 
end

always @(posedge clk) 
begin
    case(state)
    init:begin
        // control signal 
        res_rd=0;
        res_wr=0;
        fp_done=0;

        // data process
        res_addr=min_RAM_addr;
    end
    send_target_addr:begin
        res_rd=1;
    end
    check_target:begin
        res_rd=0;
    end
    send_NW:begin
        res_rd=1;
        res_addr=res_addr-129;
    end
    send_N_load_NW:begin
        // control signal 
        res_rd=1;
        res_addr=res_addr+1;

        // data process
        data=res_di;
    end
    send_NE_load_N:begin
        // control signal 
        res_rd=1;
        res_addr=res_addr+1;

        // data process
        data=(res_di<data)?res_di:data;
    end
    send_W_load_NE:begin
        // control signal
        res_rd=1;
        res_addr=res_addr+126;

        // data process
        data=(res_di<data)?res_di:data;
    end
    load_W_find_min:begin
        // control signal 
        res_rd=0;
        res_wr=1;

        // data process
        data=(res_di<data)?res_di:data;
        res_do=data+1;
        res_addr=res_addr+1;
    end
    check_RAM_addr:begin
        res_wr=0;
        res_rd=0;
        if (res_addr>MAX_RAM_addr)
            res_addr=MAX_RAM_addr;
        else
        begin
            if (res_addr[6:0]==7'b111_1110)  //126, 128+126, 128*2+126...
                res_addr=res_addr+3;
            else
                res_addr=res_addr+1;
        end
    end
    done:begin
        // control signal 
        res_wr=0;
        res_rd=0;
        fp_done=1;
    end
    endcase
end

endmodule

module backward_pass(clk, rstn, fp_done, res_rd, res_wr, res_addr, res_do, res_di, bp_done);
input clk, rstn, fp_done;
input [7:0]	res_di;
output reg res_wr, res_rd;
output reg [13:0] res_addr;
output reg [7:0] res_do;
output reg bp_done;

parameter init=0, send_target_addr=1, check_target=2, send_E=3, send_SW_load_E=4;
parameter send_S_load_SW=5, send_SE_load_S=6, load_SE_write_back=7, check_RAM_addr=8, done=9;
parameter min_RAM_addr=129, MAX_RAM_addr=128*126+126;
reg[3:0]state, nstate;
reg[7:0] original_data, data;

always @(*)
begin
    case(state)
        init: nstate=(fp_done)?send_target_addr:init;
        send_target_addr: nstate=check_target;
        check_target: nstate=(res_di==0)?check_RAM_addr:send_E;
        send_E: nstate=send_SW_load_E;
        send_SW_load_E: nstate=send_S_load_SW;
        send_S_load_SW: nstate=send_SE_load_S;
        send_SE_load_S: nstate=load_SE_write_back;
        load_SE_write_back: nstate=check_RAM_addr;
        check_RAM_addr: nstate=(res_addr<min_RAM_addr)?done:send_target_addr;
        done: nstate=done;
        default : nstate=init; 
    endcase
end

always @(posedge clk or negedge rstn) 
begin
    if (!rstn)
        state=init;
    else
        state=nstate; 
end

always @(posedge clk) 
begin
    case(state)
    init:begin
        // control signal 
        res_rd=0;
        res_wr=0;
        bp_done=0;

        // data process 
        res_addr=MAX_RAM_addr;
    end
    send_target_addr:begin
        res_rd=1;
    end
    check_target:begin
        // control signal
        res_rd=0;

        // data process
        original_data=res_di;
    end
    send_E:begin
        // control signal
        res_rd=1;

        // data process
        res_addr=res_addr+1;
    end
    send_SW_load_E:begin
        // control signal
        res_rd=1;

        // data process
        res_addr=res_addr+126;
        data=res_di;
    end
    send_S_load_SW:begin
        // control signal
        res_rd=1;

        // data process
        res_addr=res_addr+1;
        data=(res_di<data)?res_di:data;
    end
    send_SE_load_S:begin
        res_rd=1;
        res_addr=res_addr+1;
        data=(res_di<data)?res_di:data;
    end
    load_SE_write_back:begin
        // control signal
        res_rd=0;
        res_wr=1;
        // data process
        data=(res_di<data)?res_di:data;
        res_do=((data+1)<original_data)?(data+1):original_data;
        res_addr=res_addr-129;
    end
    check_RAM_addr:begin
        res_wr=0;
        res_rd=0;
        if (res_addr<min_RAM_addr)
            res_addr=min_RAM_addr;
        else
        begin
            if (res_addr[6:0]==7'b000_0001)  //129, 128+129, 128*2+129...
                res_addr=res_addr-3;
            else
                res_addr=res_addr-1;
        end
    end
    done:begin
        res_wr=0;
        res_rd=0;
        bp_done=1;
    end
    endcase
end

endmodule //bp
