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
