vlog -work work -vopt -sv -stats=none D:/MV/class_Notes/B2022_2/code/apb_protocol_code/sv_code/top.svh
vsim -voptargs=+acc work.apb_testbench_top
add wave -position insertpoint sim:/apb_testbench_top/intf_h/driver_cb/*
run -all
