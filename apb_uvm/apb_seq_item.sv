class apb_seq_item extends uvm_sequence_item;
rand bit [1:0] paddr; 
rand bit 	pselx; 
rand bit 	penable; 
rand bit 	pwrite; 
rand bit [1:0] pwdata; 
     bit 	pready; 
     bit [1:0] prdata; 
     bit 	pslave_error;
     
`uvm_object_utils_begin(apb_seq_item)
`uvm_field_int(paddr   ,UVM_ALL_ON)
`uvm_field_int(pselx   ,UVM_ALL_ON)
`uvm_field_int(penable ,UVM_ALL_ON)
`uvm_field_int(pwrite  ,UVM_ALL_ON)
`uvm_field_int(pwdata  ,UVM_ALL_ON)
`uvm_field_int(pready  ,UVM_ALL_ON)
`uvm_field_int(prdata  ,UVM_ALL_ON)
`uvm_field_int(pslave_error,UVM_ALL_ON)
`uvm_object_utils_end

function new(string name = "apb_seq_item");
super.new(name);
endfunction

constraint pwdata_l {pwdata inside {4'ha,4'hb,4'hc,4'hd};}

endclass 
