class apb_write_sequence extends uvm_sequence#(apb_seq_item); 
`uvm_object_utils(apb_write_sequence)
   
function new(string name = "apb_write_sequence");
super.new(name);
endfunction

virtual task body();
repeat(60) begin 
`uvm_do_with(req,{req.pwrite==1;});
end
endtask
endclass

//=========================================================================
// apb_read_sequence - "read" type
//=========================================================================
class apb_read_sequence extends uvm_sequence#(apb_seq_item);
`uvm_object_utils(apb_read_sequence)
   
function new(string name = "apb_read_sequence");
super.new(name);
endfunction
  
virtual task body();
repeat(60) begin 
`uvm_do_with(req,{req.pwrite==0;})
end
endtask
endclass

//=========================================================================
// write_apb_read_sequence - "write" followed by "read" 
//=========================================================================
class apb_write_read_sequence extends uvm_sequence#(apb_seq_item);
`uvm_object_utils(apb_write_read_sequence)
   
function new(string name = "apb_write_read_sequence");
super.new(name);
endfunction
  
virtual task body();
repeat(6) begin 
`uvm_do_with(req,{req.pwrite==1;})
req.print();
`uvm_do_with(req,{req.pwrite==0;})
end 
endtask
endclass

//################################################
class apb_error_sequence extends uvm_sequence#(apb_seq_item);
`uvm_object_utils(apb_error_sequence)
   
function new(string name = "apb_error_sequence");
super.new(name);
endfunction
  
virtual task body();
repeat(6) begin 
`uvm_do(req)
req.print();
if(0<req.paddr<1)
	$display("proper address");
else 
	$fatal("address is out of range");
end 
endtask
endclass
