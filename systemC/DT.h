#include "systemc.h"
#include <iostream>
#include <iomanip>
#include <string>
using namespace std;

SC_MODULE(DT)
{
	sc_in_clk clk;
	sc_in<bool> reset;
	sc_out<bool> sti_rd;
	sc_out<sc_uint<10>> sti_addr;
	sc_in<sc_uint<16>> sti_di;
	sc_out<bool> res_wr;
	sc_out<bool> res_rd;
	sc_out<sc_uint<14>> res_addr;
	sc_out<sc_uint<8>> res_do;
	sc_in<sc_uint<8>> res_di;
	sc_out<bool> done, fwpass_finish;

	sc_uint<8> mem[16384]; //128*128
	sc_uint<10> ROM_count;
	sc_uint<14> init_RAM_count, fp_wb_count, wb_RAM_count;

	sc_bit init_done, fp_done, fp_wb_done, bp_done, wb_done;

	void init();
	void forward_pass();
	void fp_wb();
	void backward_pass();
	void write_back();

	void computing_flow();

	SC_CTOR(DT)
	{
		SC_METHOD(computing_flow);
		sensitive << reset;
		sensitive << clk.pos();
	}
	~DT(){};
};
