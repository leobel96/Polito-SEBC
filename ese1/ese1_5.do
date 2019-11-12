vcom counter.vhd
vcom tb_counter.vhd
vsim -t 10ps -novopt work.testcount(test)
add wave *
power add *
power add /testcount/UCOUNTER1/*
run 518 ns
power report -file report_5_2ns.txt



