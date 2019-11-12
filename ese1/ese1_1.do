vsim -t 100ps -novopt work.tbprob(test)
add wave *
power add *
run 20 ns
power report -file report_1_20ns.txt
restart -force
add wave *
power add *
run 200 ns
power report -file report_1_200ns.txt
restart -force
add wave *
power add *
run 2000 ns
power report -file report_1_2000ns.txt
restart -force
add wave *
power add *
run 20000 ns
power report -file report_1_20000ns.txt
restart -force
add wave *
power add *
run 200000 ns
power report -file report_1_200000ns.txt
restart -force

