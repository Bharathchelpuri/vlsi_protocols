interface apb_intf(input logic pclk,presetn);
logic  [1:0] paddr; 
logic  pselx; 
logic  penable; 
logic  pwrite; 
logic  [1:0]pwdata; 
logic  pready; 
logic  [1:0]prdata; 
logic  pslave_error;

clocking driver_cb @(posedge pclk);
default input #1 output #1;
output paddr; 
output pselx; 
output penable; 
output pwrite; 
output pwdata; 
 input pready; 
 input prdata; 
 input pslave_error;
endclocking

clocking monitor_cb @(posedge pclk);
default input #1 output #1;
input paddr; 
input pselx; 
input penable; 
input pwrite; 
input pwdata; 
input pready; 
input prdata; 
input pslave_error;
endclocking

endinterface
