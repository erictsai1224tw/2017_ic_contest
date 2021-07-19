remove_design -designs
read_file -format verilog {~/B_ICC2017_preliminary_grad_cell-based/DT.v}
set_operating_conditions -min_library fast -min fast  -max_library slow -max slow
set_wire_load_model -name tsmc13_wl10 -library slow
create_clock -name "clk" -period 10 -waveform { 0 5  }  { clk  }
set_dont_touch_network  [ find clock clk ]
set_fix_hold  [ find clock clk]
set_max_area 0
compile -exact_map
write -hierarchy -format ddc -output DT.ddc
write -hierarchy -format verilog -output DT_syn.v
write_sdf -version 2.1 -context verilog DT_syn.sdf
write_sdc DT.sdc
uplevel #0 { report_timing -path full -delay max -nworst 1 -max_paths 1 -significant_digits 2 -sort_by group }
uplevel #0 { report_area -nosplit }
