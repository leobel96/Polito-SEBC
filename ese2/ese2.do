vcom dpadder.vhd
vcom fsm_adder.vhd
vcom adder.vhd
vcom tb_adder.vhd
vsim -t 100ps -novopt work.tb_adder(tb)
add wave *
add wave \
{sim:/tb_adder/dut/fsm/pres_state } \
{sim:/tb_adder/dut/fsm/next_state } 
add wave \
{sim:/tb_adder/dut/fsm/s } 
power add *
power add \
{sim:/tb_adder/dut/fsm/pres_state/enum_encoding } \
{sim:/tb_adder/dut/fsm/next_state } \
{sim:/tb_adder/dut/fsm/s } 
run 2000 ns
power report -file report.txt
