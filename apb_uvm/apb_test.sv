class apb_test extends uvm_test;
`uvm_component_utils(apb_test)

apb_env env_h;
apb_sequence seq_h;

function new(string name,uvm_component parent);
super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
env_h=apb_env::type_id::create("env_h",this);
seq_h=apb_sequence::type_id::create("seq_h");
endfunction : build_phase

virtual function void start_of_simulation();
print();
endfunction

task run_phase(uvm_phase phase);
phase.raise_objection(this);
seq_h.start(env_h.agent_h.sequencer_h);
#50;
phase.drop_objection(this);
endtask : run_phase
endclass 
