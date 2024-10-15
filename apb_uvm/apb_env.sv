class apb_env extends uvm_env;
`uvm_component_utils(apb_env)

apb_agent agent_h;
apb_scoreboard sb_h;

function new(string name,uvm_component parent);
super.new(name,parent);
endfunction 

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
agent_h=apb_agent::type_id::create("agent_h",this);
sb_h   =apb_scoreboard::type_id::create("sb_h",this);
endfunction : build_phase

function void connect_phase(uvm_phase phase); 
agent_h.monitor_h.monitor_port.connect(sb_h.scoreboard_port);
endfunction : connect_phase

endclass 
