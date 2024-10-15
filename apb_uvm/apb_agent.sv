class apb_agent extends uvm_agent;
`uvm_component_utils(apb_agent)

apb_sequencer sequencer_h;
apb_driver   driver_h;
apb_monitor  monitor_h;

function new(string name,uvm_component parent);
super.new(name,parent);
endfunction 

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
sequencer_h=apb_sequencer::type_id::create("sequencer_h",this);
driver_h   =apb_driver::type_id::create("driver_h",this);
monitor_h  =apb_monitor::type_id::create("monitor_h",this);
endfunction

function void connect_phase(uvm_phase phase); 
driver_h.seq_item_port.connect(sequencer_h.seq_item_export);
endfunction : connect_phase

endclass 
