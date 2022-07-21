onerror {quit -f}
vlib work
vlog -work work lr6.vo
vlog -work work lr6.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.lr6_vlg_vec_tst
vcd file -direction lr6.msim.vcd
vcd add -internal lr6_vlg_vec_tst/*
vcd add -internal lr6_vlg_vec_tst/i1/*
add wave /*
run -all
