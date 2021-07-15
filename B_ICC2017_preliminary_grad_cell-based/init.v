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
assign sti_addr=sti_addr_state;
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
            buff=0;
        end
        indicate_ROM:begin
            sti_rd_state=1;
        end
        load_from_ROM:begin
            sti_rd_state=0;
            buff=sti_di;
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

always @(posedge clk)
begin
	case (state)
	init:
	begin
		sti_addr_state=0;
		res_addr_state=0;
	end
	send_to_RAM:
		res_addr_state=res_addr_state+1;
	checkif_done:
	begin
		if (sti_addr_state==1023)
                	sti_addr_state=1023;
            	else
                	sti_addr_state=sti_addr_state+1;
		res_addr_state=res_addr_state+1;
	end
	endcase
end

endmodule //init
