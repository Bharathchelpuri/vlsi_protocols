//1)without top.svh 
//s1)include all the 10 files in the questasim 
//s2)arrange all the files as per the compile order 
//Note:You need to do this everytime whenever you open a questasim 

//2)with top.svh 
//s0)arrange all the files as per independent to dependent order once  in top.svh <-this is 1 time only   
//s1)open the questasim and call only top.svh  file only and run it 


//sv tb 
//.sv->system verilog file 
//.svh->system verilog header file 
//<----------------------------independent to dependent 
//tb_top 
//	test
//		env 
//			gen
//				tx 
//			bfm
//			mon 
//			scb 
//	interface
//	dut 
//
////////////////////////////////////////////////////////////////////////////////////////////////////
`include "apb_config.sv"
`include "apb_tx.sv"
`include "apb_gen.sv"
`include "apb_bfm.sv"
`include "apb_mon.sv"
`include "apb_scb.sv"
`include "apb_env.sv"
`include "apb_test.sv"
`include "apb_interface.sv"
`include "apb_dut.sv"
`include "apb_tb_top.sv"
