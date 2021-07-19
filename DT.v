`timescale 1ns/10ps
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
output sti_rd;
output [9:0] sti_addr;
input [15:0] sti_di;
output res_wr;
output [13:0]res_addr;
output [7:0]res_do;
output initialize_done;

reg sti_rd_state, res_wr_state, initialize_done_state;
parameter init=0, indicate_ROM=1, load_from_ROM=2, send_to_RAM_0=3, send_to_RAM=4, checkif_done=5, done=6;
reg [2:0]state, nstate;
reg [9:0]sti_addr_state;
reg [3:0]buf_state, buf_nstate;
reg [0:15]buff;
reg [7:0]res_do_state;
reg [13:0]res_addr_state;

assign sti_addr=sti_addr_state;
assign res_do=res_do_state;
assign sti_rd=sti_rd_state;
assign res_wr=res_wr_state;
assign initialize_done=initialize_done_state;
assign res_addr=res_addr_state;

always @(*) 
begin
    case(state)
        init: nstate=indicate_ROM;
        indicate_ROM: nstate=load_from_ROM;
        load_from_ROM: nstate=send_to_RAM_0;
        send_to_RAM_0: nstate=send_to_RAM;
        send_to_RAM: nstate=(buf_state==4'b1111)?checkif_done:send_to_RAM;
        checkif_done: nstate=(sti_addr_state==1023)?done:indicate_ROM;
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
            sti_rd_state=0;
            res_wr_state=0;
            initialize_done_state=0;
            res_do_state=0;
        end
        indicate_ROM:begin
            sti_rd_state=1;
            res_wr_state=0;
        end
        load_from_ROM:begin
            sti_rd_state=0;
            res_wr_state=0;
        end
        send_to_RAM_0:begin
            res_do_state={7'b0, buff[buf_state]};
            res_wr_state=1;
        end
        send_to_RAM:begin
            res_do_state={7'b0, buff[buf_state]};
            res_wr_state=1;
        end
        checkif_done:begin
            res_wr_state=0;
        end
        done:begin
            sti_rd_state=0;
            res_wr_state=0;
            initialize_done_state=1;
        end

    endcase
end

always @(posedge clk) begin
    case (state)
        init: buff<=16'b0;
        load_from_ROM: buff<=sti_di;
        default : buff<=buff;
    endcase
end

always @(*) begin
    case (buf_state)
        15: buf_nstate=15;
        default :buf_nstate=buf_state+1;
    endcase
end

always @(posedge clk) begin
    case(state)
        init: buf_state=0;
        send_to_RAM_0: buf_state=buf_nstate;
        send_to_RAM: buf_state=buf_nstate;
        default : buf_state=0;
    endcase
end

always @(posedge clk)
begin
	case (state)
	init:
	begin
		sti_addr_state<=0;
		res_addr_state<=0;
	end
    send_to_RAM_0:
    begin
        res_addr_state<=res_addr_state+1;
    end
	send_to_RAM:
		res_addr_state<=res_addr_state+1;
	checkif_done:
	begin
		if (sti_addr_state==1023)
                	sti_addr_state<=1023;
            	else
                	sti_addr_state<=sti_addr_state+1;
	end
	endcase
end

endmodule //init

module forward_pass(clk, rstn, initialize_done, res_rd, res_wr, res_addr, res_do, res_di, fp_done);
input clk, rstn, initialize_done;
input [7:0]	res_di;
output res_wr, res_rd;
output [13:0] res_addr;
output [7:0] res_do;
output fp_done;

parameter init=0, send_target_addr=1, check_target=2, send_NW=3, send_N_load_NW=4;
parameter send_NE_load_N=5, send_W_load_NE=6, load_W_find_min=7, check_RAM_addr=8, done=9;
parameter min_RAM_addr=129, MAX_RAM_addr=128*126+126;
reg[3:0]state, nstate;

reg [13:0]res_addr_state;
reg res_rd_state, res_wr_state, fp_done_state;
reg[7:0] data;
reg[7:0] res_do_state;
reg [7:0] input_data;

always @(*)
begin
    case(state)
        init: nstate=(initialize_done)?send_target_addr:init;
        send_target_addr: nstate=check_target;
        check_target: nstate=(input_data==0)?check_RAM_addr:send_NW;
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
    case(nstate)
    init:begin
        res_addr_state<=min_RAM_addr;
    end
    send_target_addr:begin
        input_data=0;
    end
    check_target:begin
        input_data=res_di;
    end
    send_NW:begin
        res_addr_state<=res_addr_state-129;
    end
    send_N_load_NW:begin
        res_addr_state<=res_addr_state+1;
        data<=res_di;
    end
    send_NE_load_N:begin
        res_addr_state<=res_addr_state+1;
        data<=(res_di<data)?res_di:data;
    end
    send_W_load_NE:begin
        res_addr_state<=res_addr_state+126;
        data<=(res_di<data)?res_di:data;
    end
    load_W_find_min:begin
        res_addr_state<=res_addr_state+1;
        data<=(res_di<data)?res_di:data;
    end
    check_RAM_addr:begin
        if (res_addr_state>MAX_RAM_addr)
            res_addr_state<=MAX_RAM_addr;
        else
        begin
            if (res_addr_state[6:0]==7'b111_1110)  //126, 128+126, 128*2+126...
                res_addr_state<=res_addr_state+3;
            else
                res_addr_state<=res_addr_state+1;
        end
    end
    done:begin
    end
    endcase
end

always @(*) 
begin
    case(state)
    init:begin
        res_rd_state=0;
        res_wr_state=0;
        fp_done_state=0;
        res_do_state=0;
    end
    send_target_addr:begin
        res_rd_state=1;
        res_do_state=0;
    end
    check_target:begin
        res_rd_state=0;
    end
    send_NW:begin
        res_rd_state=1;
    end
    send_N_load_NW:begin
        res_rd_state=1;
        
    end
    send_NE_load_N:begin
        res_rd_state=1;
        
    end
    send_W_load_NE:begin
        res_rd_state=1;
        
    end
    load_W_find_min:begin
        res_rd_state=0;
        res_wr_state=1;
        res_do_state=data+1;
    end
    check_RAM_addr:begin
        res_wr_state=0;
        res_rd_state=0;
    end
    done:begin
        res_wr_state=0;
        res_rd_state=0;
        fp_done_state=1;
    end
    endcase
end

assign res_wr=res_wr_state;
assign res_rd=res_rd_state;
assign fp_done=fp_done_state;
assign res_addr=res_addr_state;
assign res_do=res_do_state;

endmodule

module backward_pass(clk, rstn, fp_done, res_rd, res_wr, res_addr, res_do, res_di, bp_done);
input clk, rstn, fp_done;
input [7:0]	res_di;
output res_wr, res_rd;
output [13:0] res_addr;
output [7:0] res_do;
output bp_done;

parameter init=0, send_target_addr=1, check_target=2, send_E=3, send_SW_load_E=4;
parameter send_S_load_SW=5, send_SE_load_S=6, load_SE_write_back=7, check_RAM_addr=8, done=9;
parameter min_RAM_addr=129, MAX_RAM_addr=128*126+126;
reg[3:0]state, nstate;

reg [13:0] res_addr_state;
reg res_rd_state, res_wr_state, bp_done_state;
reg[7:0] input_data, data;
reg[7:0] res_do_state;

always @(*)
begin
    case(state)
        init: nstate=(fp_done)?send_target_addr:init;
        send_target_addr: nstate=check_target;
        check_target: nstate=(input_data==0)?check_RAM_addr:send_E;
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
        state<=init;
    else
        state<=nstate; 
end

always @(posedge clk) 
begin
    case(nstate)
    init:begin
        res_addr_state<=MAX_RAM_addr;
        data<=0;
        input_data<=0;
    end
    send_target_addr:begin
    end
    check_target:begin
        input_data<=res_di;
    end
    send_E:begin
        res_addr_state<=res_addr_state+1;
    end
    send_SW_load_E:begin
        res_addr_state<=res_addr_state+126;
        data<=res_di;
    end
    send_S_load_SW:begin
        res_addr_state<=res_addr_state+1;
        data<=(res_di<data)?res_di:data;
    end
    send_SE_load_S:begin
        res_addr_state<=res_addr_state+1;
        data<=(res_di<data)?res_di:data;
    end
    load_SE_write_back:begin
        res_addr_state<=res_addr_state-129;
        data<=(res_di<data)?res_di:data;
    end
    check_RAM_addr:begin
        if (res_addr_state<min_RAM_addr)
            res_addr_state<=min_RAM_addr;
        else
        begin
            if (res_addr_state[6:0]==7'b000_0001)  //129, 128+129, 128*2+129...
                res_addr_state<=res_addr_state-3;
            else
                res_addr_state<=res_addr_state-1;
        end
    end
    endcase
end

always @(*) 
begin
    case(state)
    init:begin
        res_rd_state=0;
        res_wr_state=0;
        bp_done_state=0;
        res_do_state=0;
    end
    send_target_addr:begin
        res_rd_state=1;
        res_do_state=0;
    end
    check_target:begin
        res_rd_state=0;
    end
    send_E:begin
        res_rd_state=1;
    end
    send_SW_load_E:begin
        res_rd_state=1;
    end
    send_S_load_SW:begin
        res_rd_state=1;
    end
    send_SE_load_S:begin
        res_rd_state=1;
    end
    load_SE_write_back:begin
        res_rd_state=0;
        res_wr_state=1;
        res_do_state=((data+1)<input_data)?(data+1):input_data;;
    end
    check_RAM_addr:begin
        res_wr_state=0;
        res_rd_state=0;
    end
    done:begin
        res_wr_state=0;
        res_rd_state=0;
        bp_done_state=1;
    end
    endcase
end

assign res_wr=res_wr_state;
assign res_rd=res_rd_state;
assign bp_done=bp_done_state;
assign res_addr=res_addr_state;
assign res_do=res_do_state;

endmodule
