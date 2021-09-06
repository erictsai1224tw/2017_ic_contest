###################################################################

# Created by write_sdc on Mon Sep  6 12:03:44 2021

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max slow -max_library slow\
                         -min fast -min_library fast
set_wire_load_model -name tsmc13_wl10 -library slow
set_max_area 0
create_clock [get_ports clk]  -period 10  -waveform {0 5}
