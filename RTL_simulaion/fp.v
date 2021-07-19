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

reg [13:0]RAM_addr, RAM_addr_target;
reg res_rd_state, res_wr_state, fp_done_state;
reg[7:0] NW, N, NE, W;
reg [7:0] v12, v34, v1234;  //for compare NW, N, NE, W
reg[7:0] res_do_state;
reg [7:0]input_data;

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
    case(state)
    init:begin
        RAM_addr=min_RAM_addr;
        res_rd_state=0;
        res_wr_state=0;
        fp_done_state=0;
        res_do_state=0;
    end
    send_target_addr:begin
        input_data=0;
        RAM_addr=RAM_addr;
        res_rd_state=1;
        res_do_state=0;
        NW=8'b0;
        N=8'b0;
        NE=8'b0;
        W=8'b0;
    end
    check_target:begin
        input_data=res_di;
        RAM_addr=RAM_addr;
        RAM_addr_target=RAM_addr;
        res_rd_state=0;
    end
    send_NW:begin
        res_rd_state=1;
        RAM_addr=RAM_addr_target-129;
    end
    send_N_load_NW:begin
        res_rd_state=1;
        RAM_addr=RAM_addr_target-128;
        NW=res_di;
    end
    send_NE_load_N:begin
        res_rd_state=1;
        RAM_addr=RAM_addr_target-127;
        N=res_di;
    end
    send_W_load_NE:begin
        res_rd_state=1;
        RAM_addr=RAM_addr_target-1;
        NE=res_di;
    end
    load_W_find_min:begin
        res_rd_state=0;
        W=res_di;
        v12=(NW<N)?NW:N;
        v34=(NE<W)?NE:W;
        v1234=(v12<v34)?v12:v34;
        res_wr_state=1;
        res_do_state=v1234+1;
        RAM_addr=RAM_addr_target;
    end
    check_RAM_addr:begin
        res_wr_state=0;
        res_rd_state=0;
        if (RAM_addr>MAX_RAM_addr)
            RAM_addr=MAX_RAM_addr;
        else
        begin
            if (RAM_addr[6:0]==7'b111_1110)  //126, 128+126, 128*2+126...
                RAM_addr=RAM_addr+3;
            else
                RAM_addr=RAM_addr+1;
        end
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
assign res_addr=RAM_addr;
assign res_do=res_do_state;

endmodule
