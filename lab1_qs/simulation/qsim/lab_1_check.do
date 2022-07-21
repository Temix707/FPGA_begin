onerror {quit -f}
vlib work
vlog -work work lab_1_check.vo
vlog -work work lab_1_check.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.check_me_1_vlg_vec_tst
vcd file -direction lab_1_check.msim.vcd
vcd add -internal check_me_1_vlg_vec_tst/*
vcd add -internal check_me_1_vlg_vec_tst/i1/*
add wave /*
run -all
