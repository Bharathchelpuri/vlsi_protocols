class apb_driver extends uvm_driver#(apb_seq_item);
`uvm_component_utils(apb_driver)

apb_seq_item tx; 
virtual apb_intf intf;

function new(string name,uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
if(!uvm_config_db#(virtual apb_intf)::get(this, "", "vif", intf))
`uvm_fatal("NO_VIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
endfunction: build_phase

virtual task run_phase(uvm_phase phase);
forever begin
seq_item_port.get_next_item(tx);
driver_logic();
seq_item_port.item_done();
end
endtask : run_phase
task driver_logic(apb_transaction tx);
@(posedge intf.pclk)
begin 
intf.driver_cb.paddr         <=tx.paddr;
intf.driver_cb.pselx         <=tx.pselx;
intf.driver_cb.pwrite        <=tx.pwrite;
intf.driver_cb.penable       <=tx.penable;
tx.pready          	     <=intf.driver_cb.pready;
tx.pslave_error    	     <=intf.driver_cb.pslave_error;

if(tx.pwrite==1)
begin
intf.driver_cb.pwdata        <=tx.pwdata;
end 

if(tx.pwrite==0)
begin 	
tx.prdata  	             <=intf.driver_cb.prdata;
end 

end
endtask
endclass 
