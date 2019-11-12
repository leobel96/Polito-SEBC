vcom fa.vhd
vcom rca.vhd
vcom tb_rca2.vhd
vsim -t 10ps -novopt work.tbrca(test)
add wave *
power add *
run 200 ns
power report -file report_3_200ns.txt



