module apb_tb_top;
bit pclk;
bit presetn;

always  #5 pclk=~pclk;

initial begin 
presetn=0;
#5 presetn=1;
end 

apb_intf intf_h(pclk,presetn); 

apb_slave apb_dut( 
		   .pclk   		(intf_h.pclk),
          	   .presetn	(intf_h.presetn), 
		   .paddr  		(intf_h.paddr), 
		   .pwdata 	(intf_h.pwdata), 
		   .prdata 		(intf_h.prdata), 
		   .pselx  		(intf_h.pselx), 
		   .pwrite 		(intf_h.pwrite), 
		   .pready 		(intf_h.pready), 
		   .penable	(intf_h.penable), 
		   .pslave_error  (intf_h.pslave_error));


initial begin 
apb_config_db::vintf=intf_h;
end	

apb_test test_h();

initial begin
#200 $finish;
end

endmodule 
