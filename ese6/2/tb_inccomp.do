vcom -93 -work ./work ./v1/src/utils/constants.vhd
vcom -93 -work ./work ./v1/src/P4_1/carry_generator.vhd
vcom -93 -work ./work ./v1/src/P4_1/carry_logic_network.vhd
vcom -93 -work ./work ./v1/src/P4_1/carry_select_block.vhd
vcom -93 -work ./work ./v1/src/P4_1/g_block.vhd
#vcom -93 -work ./work ./v1/src/P4_1/p4_adder.vhd
vcom -93 -work ./work ./v1/src/P4_1/p4_adder_1.vhd
vcom -93 -work ./work ./v1/src/P4_1/pg_block.vhd
vcom -93 -work ./work ./v1/src/P4_1/pg_network.vhd
vcom -93 -work ./work ./v1/src/P4_1/pg_network_block.vhd
vcom -93 -work ./work ./v1/src/P4_1/sum_generator.vhd
vcom -93 -work ./work ./v1/src/P4_2/carry_generator.vhd
vcom -93 -work ./work ./v1/src/P4_2/carry_logic_network.vhd
vcom -93 -work ./work ./v1/src/P4_2/carry_select_block.vhd
vcom -93 -work ./work ./v1/src/P4_2/g_block.vhd
#vcom -93 -work ./work ./v1/src/P4_2/p4_adder.vhd
vcom -93 -work ./work ./v1/src/P4_2/p4_adder_2.vhd
vcom -93 -work ./work ./v1/src/P4_2/pg_block.vhd
vcom -93 -work ./work ./v1/src/P4_2/pg_network.vhd
vcom -93 -work ./work ./v1/src/P4_2/pg_network_block.vhd
vcom -93 -work ./work ./v1/src/P4_2/sum_generator.vhd
vcom -93 -work ./work ./v1/src/utils/andgate2.vhd
vcom -93 -work ./work ./v1/src/utils/comparator.vhd
vcom -93 -work ./work ./v1/src/utils/fa.vhd
vcom -93 -work ./work ./v1/src/utils/mux21_generic.vhd
vcom -93 -work ./work ./v1/src/utils/notgate.vhd
vcom -93 -work ./work ./v1/src/utils/orgate2.vhd
vcom -93 -work ./work ./v1/src/utils/rca_gen.vhd
vcom -93 -work ./work ./v1/src/utils/RegisterN.vhd
vcom -93 -work ./work ./v1/src/inccomp.vhd

vcom -93 -work ./work ./vREF/src/utils/constants.vhd
vcom -93 -work ./work ./vREF/src/P4_1/carry_generator.vhd
vcom -93 -work ./work ./vREF/src/P4_1/carry_logic_network.vhd
vcom -93 -work ./work ./vREF/src/P4_1/carry_select_block.vhd
vcom -93 -work ./work ./vREF/src/P4_1/g_block.vhd
vcom -93 -work ./work ./vREF/src/P4_1/p4_adder_1.vhd
vcom -93 -work ./work ./vREF/src/P4_1/pg_block.vhd
vcom -93 -work ./work ./vREF/src/P4_1/pg_network.vhd
vcom -93 -work ./work ./vREF/src/P4_1/pg_network_block.vhd
vcom -93 -work ./work ./vREF/src/P4_1/sum_generator.vhd
vcom -93 -work ./work ./vREF/src/P4_2/carry_generator.vhd
vcom -93 -work ./work ./vREF/src/P4_2/carry_logic_network.vhd
vcom -93 -work ./work ./vREF/src/P4_2/carry_select_block.vhd
vcom -93 -work ./work ./vREF/src/P4_2/g_block.vhd
vcom -93 -work ./work ./vREF/src/P4_2/p4_adder_2.vhd
vcom -93 -work ./work ./vREF/src/P4_2/pg_block.vhd
vcom -93 -work ./work ./vREF/src/P4_2/pg_network.vhd
vcom -93 -work ./work ./vREF/src/P4_2/pg_network_block.vhd
vcom -93 -work ./work ./vREF/src/P4_2/sum_generator.vhd
vcom -93 -work ./work ./vREF/src/utils/andgate2.vhd
vcom -93 -work ./work ./vREF/src/utils/comparator.vhd
vcom -93 -work ./work ./vREF/src/utils/fa.vhd
vcom -93 -work ./work ./vREF/src/utils/mux21_generic.vhd
vcom -93 -work ./work ./vREF/src/utils/notgate.vhd
vcom -93 -work ./work ./vREF/src/utils/orgate2.vhd
vcom -93 -work ./work ./vREF/src/utils/rca_gen.vhd
vcom -93 -work ./work ./vREF/src/utils/RegisterN.vhd
vcom -93 -work ./work ./vREF/src/inccomp.vhd

vcom -93 -work ./work tb_inccomp.vhd

vsim -t ns -novopt work.inccomp_tb

set NumericStdNoWarnings 1 
run 0 ps
set NumericStdNoWarnings 0 

add wave -radix decimal *
run 100 us
