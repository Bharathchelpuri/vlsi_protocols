///////////////////////////////////////////////////////////////////////////////////////////
//we will follow indepedent to dependet order while writing the filename 
//<------------------------------------indepedent to dependent order you need to follow 
//tb_top 
//	test
//       	env 
//			sb 
//			agent 
//				seqr
//			       		seq 
//						seq_item 	
//				drv 
//				mon 
//	interface 
//	dut
//
//
//All other files are part of top.svh--->	|top.svh--->Questa_Sim 
///////////////////////////////////////////////////////////////////////////////////////////
import uvm_pkg::*;      //uvm libraray files 
`include "uvm_macros.svh"//uvm librarty files `  they run during compilation time 
`include "apb_interface.sv";
`include "apb_dut.sv";
`include "apb_seq_item.sv";
`include "apb_sequence.sv"//if any line starts with ` then ; is optional 
`include "apb_sequencer.sv"
`include "apb_driver.sv"
`include "apb_monitor.sv" //write calling in monitor 
`include "apb_agent.sv" 
`include "apb_scoreboard.sv" //write defination 
`include "apb_env.sv"
`include "apb_all_test.sv"
`include "apb_tb_top.sv";
