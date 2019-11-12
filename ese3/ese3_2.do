vcom inccomp.vhd
vlog tb_inccomp.v
vsim -t 10fs -novopt work.tbinccomp
add wave *
run 100 ns
