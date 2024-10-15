class apb_mon;
virtual apb_intf intf;
apb_transaction tx;

task mon_main();

intf=apb_config_db::vintf;
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



apb_config_db::mon2scb.put(tx);
end
endtask 

endclass
