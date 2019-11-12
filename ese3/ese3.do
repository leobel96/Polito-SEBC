vcom fd.vhd
vcom ckgbug.vhd
vsim -t 10fs -novopt work.ckgbug(test)
add wave *
run 3 ns
