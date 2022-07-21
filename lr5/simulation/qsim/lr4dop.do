onerror {quit -f}
vlib work
vlog -work work lr4dop.vo
vlog -work work lr4dop.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.lr4dop_vlg_vec_tst
vcd file -direction lr4dop.msim.vcd
vcd add -internal lr4dop_vlg_vec_tst/*
vcd add -internal lr4dop_vlg_vec_tst/i1/*
add wave /*
run -all
