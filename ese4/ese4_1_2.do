vcom busnormal.vhd
vcom businvbeh.vhd
vcom transbased.vhd
vcom grayencoder.vhd
vcom busT0.vhd
vlog tb_encdec.v
vsim -t 1ps -novopt work.testbench
add wave *
power add *
run 100 us
power report -file modelsim-power-reports/all-data-sim.txt
