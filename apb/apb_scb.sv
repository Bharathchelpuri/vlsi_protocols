class apb_scb;
apb_transaction tx;
apb_transaction tx_queue[$];
bit [7:0] golden_dut_mem [4];


task checker_logic;
if(tx.pwrite==1) begin 
golden_dut_mem[tx.paddr]=tx.pwdata;
end 
if(tx.pwrite==0) begin

		if(golden_dut_mem[tx.paddr] == tx.prdata) begin
		$display("PASS");
		end 
else 
		begin
		$display("Paddr=%d,excepted_data=%d,actual_data=%d",tx.paddr,golden_dut_mem[tx.paddr],tx.prdata);       	
		$display("FAIL");
		end 
end 
endtask 


task scb_main;
forever begin 
apb_config_db::mon2scb.get(tx);
tx_queue.push_back(tx);

wait(tx_queue.size() > 0) begin 
tx=tx_queue.pop_front();
tx.display();
checker_logic;
end 
end 
endtask 
endclass 
