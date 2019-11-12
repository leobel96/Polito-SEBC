vcom fa.vhd
vcom rca.vhd
vcom lfsr.vhd
vcom tb_rca.vhd
vsim -t 1ps -novopt work.tbrca(test)
add wave *
power add *
run 200 ns
power report -file report_2_200ns.txt



