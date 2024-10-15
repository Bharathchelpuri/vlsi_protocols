vlog -work work -vopt -sv -stats=none D:/MV/class_Notes/B2022_2/code/apb_protocol_code/apb_code_windows_linux/uvm_code_without_run_do/top.svh

#write_read_test 
vsim -voptargs=+acc +UVM_TESTNAME=apb_write_read_test  -sv_seed 7897 +UVM_OBJECTION_TRACE work.apb_tb_top -l apb_write_read_test.log  
add wave -position insertpoint sim:/apb_tb_top/intf_h/*
run -all

#write_test 
#vsim -voptargs=+acc +UVM_TESTNAME=apb_write_test       work.apb_tb_top +UVM_OBJECTION_TRACE +UVM_OBJECTION_TRACE -l apb_write_test.log
#add wave -position insertpoint sim:/apb_tb_top/intf_h/*
#run -all 

#read test 
#vsim -voptargs=+acc +UVM_TESTNAME=apb_read_test  -sv_seed 1234   +UVM_OBJECTION_TRACE work.apb_tb_top -l apb_read_test.log  
#add wave -position insertpoint sim:/apb_tb_top/intf_h/*
#run -all

#errortest 
#vsim -voptargs=+acc +UVM_TESTNAME=apb_error_test  -sv_seed 1234   +UVM_OBJECTION_TRACE work.apb_tb_top -l apb_read_test.log  
#add wave -position insertpoint sim:/apb_tb_top/intf_h/*
#run -all
