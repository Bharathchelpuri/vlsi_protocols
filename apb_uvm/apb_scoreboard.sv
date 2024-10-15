class apb_scoreboard extends uvm_scoreboard;
`uvm_component_utils(apb_scoreboard);

uvm_analysis_imp #(apb_seq_item,apb_scoreboard) scoreboard_port;
  

bit [7:0] golden_dut_mem [4];
apb_seq_item tx_queue[$];

function new(string name,uvm_component parent);
super.new(name,parent);
scoreboard_port = new("scoreboard_port", this);
foreach(golden_dut_mem[i]) 
golden_dut_mem[i] = 8'h00;
endfunction

virtual function void write(apb_seq_item tx);
tx_queue.push_back(tx);
endfunction


virtual task run_phase(uvm_phase phase);
apb_seq_item apb_tx2;
forever begin
wait(tx_queue.size() > 0);
apb_tx2 = tx_queue.pop_front();
if(apb_tx2.pwrite==1) begin
  golden_dut_mem[apb_tx2.paddr] = apb_tx2.pwdata;
  `uvm_info(get_type_name(),$sformatf("------ :: WRITE DATA       :: ------"),UVM_LOW)
  `uvm_info(get_type_name(),$sformatf("Addr: %0h",apb_tx2.paddr),UVM_LOW)
  `uvm_info(get_type_name(),$sformatf("Data: %0h",apb_tx2.pwdata),UVM_LOW)
  `uvm_info(get_type_name(),"------------------------------------",UVM_LOW)        
end
else if(apb_tx2.pwrite==0) begin

if(golden_dut_mem[apb_tx2.paddr] == apb_tx2.prdata) begin
  `uvm_info(get_type_name(),$sformatf("------ :: READ DATA Match :: ------"),UVM_LOW)
  `uvm_info(get_type_name(),$sformatf("Addr: %0h",apb_tx2.paddr),UVM_LOW)
  `uvm_info(get_type_name(),$sformatf("Expected Data: %0h Actual Data: %0h",golden_dut_mem[apb_tx2.paddr],apb_tx2.prdata),UVM_LOW)
  `uvm_info(get_type_name(),"------------------------------------",UVM_LOW)
end


else begin
  `uvm_error(get_type_name(),"------ :: READ DATA MisMatch :: ------")
  `uvm_info(get_type_name(),$sformatf("Addr: %0h",apb_tx2.paddr),UVM_LOW)
  `uvm_info(get_type_name(),$sformatf("Expected Data: %0h Actual Data: %0h",golden_dut_mem[apb_tx2.paddr],apb_tx2.prdata),UVM_LOW)
  `uvm_info(get_type_name(),"------------------------------------",UVM_LOW)
end
end 
end 
endtask 
endclass 
