onerror {quit -f}
vlib work
vlog -work work shift_reg_l4.vo
vlog -work work shift_reg_l4.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.shift_reg_l4_vlg_vec_tst
vcd file -direction shift_reg_l4.msim.vcd
vcd add -internal shift_reg_l4_vlg_vec_tst/*
vcd add -internal shift_reg_l4_vlg_vec_tst/i1/*
add wave /*
run -all
