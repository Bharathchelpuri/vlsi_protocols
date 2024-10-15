class apb_monitor extends uvm_monitor;
`uvm_component_utils(apb_monitor);

apb_seq_item tx;
virtual apb_intf intf;

uvm_analysis_port #(apb_seq_item) monitor_port;

function new(string name,uvm_component parent);
super.new(name,parent);
monitor_port = new("monitor_port", this);
tx =new();
endfunction 

function void build_phase(uvm_phase phase);
super.build_phase(phase);
if(!uvm_config_db#(virtual apb_intf)::get(this, "", "vif", intf))
`uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
endfunction: build_phase

virtual task run_phase(uvm_phase phase);
forever begin
@(posedge intf.pclk);
 begin 
tx.paddr   	=intf.monitor_cb.paddr;
tx.pselx   	=intf.monitor_cb.pselx;
tx.penable 	=intf.monitor_cb.penable;
tx.pwrite  	=intf.monitor_cb.pwrite;
tx.pwdata  	=intf.monitor_cb.pwdata;
tx.pready  	=intf.monitor_cb.pready;
tx.prdata  	=intf.monitor_cb.prdata;
tx.pslave_error =intf.monitor_cb.pslave_error;
end
monitor_port.write(tx);
end 
endtask
endclass 
