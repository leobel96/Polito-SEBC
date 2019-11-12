vcom -93 -work ./work ./v3/counter.vhd

vcom -93 -work ./work ./vREF/counter_ref.vhd

vcom -93 -work ./work tb_cnt.vhd

vsim -t ns -novopt work.tb_cnt

set NumericStdNoWarnings 1 
run 0 ps
set NumericStdNoWarnings 0 

add wave -radix decimal *
run 100 ns
