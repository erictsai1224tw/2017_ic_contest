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

reg [13:0]RAM_addr, RAM_addr_target;
reg res_rd_state, res_wr_state, bp_done_state;
reg[7:0] target, E, SW, S, SE;
reg [7:0] v12, v34, v1234, v123456;  //for compare target, E, SW, S, SE
reg[7:0] res_do_state;

always @(*)
begin
    case(state)
        init: nstate=(fp_done)?send_target_addr:init;
        send_target_addr: nstate=check_target;
        check_target: nstate=(target==0)?check_RAM_addr:send_E;
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
        RAM_addr=MAX_RAM_addr;
        res_rd_state=0;
        res_wr_state=0;
        bp_done_state=0;
        res_do_state=0;
    end
    send_target_addr:begin
        target=0;
        RAM_addr=RAM_addr;
        res_rd_state=1;
        res_do_state=0;
        E=8'b0;
        SW=8'b0;
        S=8'b0;
        SE=8'b0;
    end
    check_target:begin
        target=res_di;
        RAM_addr=RAM_addr;
        RAM_addr_target=RAM_addr;
        res_rd_state=0;
    end
    send_E:begin
        res_rd_state=1;
        RAM_addr=RAM_addr_target+1;
    end
    send_SW_load_E:begin
        res_rd_state=1;
        RAM_addr=RAM_addr_target+127;
        E=res_di;
    end
    send_S_load_SW:begin
        res_rd_state=1;
        RAM_addr=RAM_addr_target+128;
        SW=res_di;
    end
    send_SE_load_S:begin
        res_rd_state=1;
        RAM_addr=RAM_addr_target+129;
        S=res_di;
    end
    load_SE_write_back:begin
        res_rd_state=0;
        res_wr_state=1;
        SE=res_di;
        v12=(E<SW)?E:SW;
        v34=(S<SE)?S:SE;
        v1234=(v12<v34)?v12:v34;
        v123456 = ((v1234+1)<target)?(v1234+1):target;
        res_do_state=v123456;
        RAM_addr=RAM_addr_target;
    end
    check_RAM_addr:begin
        res_wr_state=0;
        res_rd_state=0;
        if (RAM_addr<min_RAM_addr)
            RAM_addr=min_RAM_addr;
        else
        begin
            if (RAM_addr[6:0]==7'b000_0001)  //129, 128+129, 128*2+129...
                RAM_addr=RAM_addr-3;
            else
                RAM_addr=RAM_addr-1;
        end
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
assign res_addr=RAM_addr;
assign res_do=res_do_state;

endmodule
