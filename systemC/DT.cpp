#include "DT.h"

void DT::computing_flow()
{
    if (reset.read() == 0)
    {
        init_done = 0;
        fp_done = 0;
        bp_done = 0;
        init_RAM_count = 0;
        ROM_count = 0;
        res_wr.write(0);
        res_addr.write(0);
        res_do.write(0);
        done.write(0);
        wb_RAM_count = 0;
        wb_done = 0;
        fwpass_finish.write(0);
        //cout << "reset\n";
    }
    else if (!init_done)
    {
        DT::init();
        //cout << init_done << " init\n";
    }
    else if (!fp_done)
    {
        DT::forward_pass();
        fp_done = 1;
        //cout << "fp\n";
    }
    else if (!fp_wb_done)
    {
        DT::fp_wb();
    }
    else if (!bp_done)
    {
        DT::backward_pass();
        bp_done = 1;
        //cout << "bp\n";
    }
    else if (!wb_done)
    {
        DT::write_back();
    }
    else
        cout << "default\n";
}

void DT::init()
{
    sti_rd.write(1);
    if (ROM_count == 0)
    {
        sti_addr.write(ROM_count);
        ROM_count = 1;
        init_RAM_count = 0;
    }
    else
    {
        for (int i = 0; i < 16; i++)
        {
            mem[init_RAM_count + i] = sti_di.read()[15 - i];
        }

        sti_addr.write(ROM_count);
        ROM_count = ROM_count + 1;
        init_RAM_count = init_RAM_count + 16;
        if (ROM_count == 1023)
        {
            sti_rd.write(0);
            // cout << "init_RAM_count: " << init_RAM_count << endl;
            cout << "initial done, show the content copy from ROM:" << endl;
            init_done = 1;
            for (int j = 0; j < 128 * 128; j++)
            {
                cout << mem[j];
                if ((j - 127) % 128 == 0)
                    cout << endl;
            }
        }
    }
}

void DT::forward_pass()
{
    int i = 129;
    while (i < 128 * 127)
    {
        if (mem[i] != 0) //do when input!=0
        {
            sc_uint<8> NW, N, NE, W, NW_N_cmp, NE_W_cmp, final_cmp;
            NW = mem[i - 129];
            N = mem[i - 128];
            NE = mem[i - 127];
            W = mem[i - 1];
            NW_N_cmp = (NW < N) ? NW : N;
            NE_W_cmp = (NE < W) ? NE : W;
            final_cmp = (NW_N_cmp < NE_W_cmp) ? NW_N_cmp : NE_W_cmp;
            mem[i] = final_cmp + 1;
        }
        if ((i - 126) % 128 == 0)
            i += 3;
        else
            i++;
    }
    fp_done = 1;
    // cout << "\nforward pass:\n";
    // for (int j = 0; j < 128 * 128; j++)
    // {
    //     cout << mem[j];
    //     if ((j - 127) % 128 == 0)
    //         cout << endl;
    // }
}

void DT::fp_wb()
{
    res_wr.write(1);
    res_addr.write(fp_wb_count);
    res_do.write(mem[fp_wb_count]);
    fp_wb_count++;
    if (fp_wb_count == 128 * 128 - 1)
    {
        fwpass_finish.write(1);
        fp_wb_done = 1;
        res_wr.write(0);
    }
}

void DT::backward_pass()
{
    int i = 126 + 128 * 126;
    while(i>128)
    {
        if (mem[i] != 0) //do when input!=0
        {
            sc_uint<8> E, SW, S, SE, E_SW_cmp, S_SE_cmp, final_cmp;
            E = mem[i + 1];
            SW = mem[i + 127];
            S = mem[i + 128];
            SE = mem[i + 129];
            E_SW_cmp = (E < SW) ? E : SW;
            S_SE_cmp = (S < SE) ? S : SE;
            final_cmp = (E_SW_cmp < S_SE_cmp) ? E_SW_cmp : S_SE_cmp;
            final_cmp++;
            mem[i] = (mem[i] < final_cmp) ? mem[i] : final_cmp;
        }
        if ((i-1)%128==0)
            i-=3;
        else
            i-=1;
    }
    // cout << "\nbackward pass:\n";
    // for (int j = 0; j < 128 * 128; j++)
    // {
    //     cout << mem[j];
    //     if ((j - 127) % 128 == 0)
    //         cout << endl;
    // }
    bp_done = 1;
}

void DT::write_back()
{
    res_wr.write(1);
    res_addr.write(wb_RAM_count);
    res_do.write(mem[wb_RAM_count]);
    wb_RAM_count++;
    if (wb_RAM_count == 128 * 128 - 1)
    {
        done.write(1);
        wb_done = 1;
        res_wr.write(0);
    }
}
