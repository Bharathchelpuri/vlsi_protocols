class apb_bfm;
apb_transaction tx;
virtual apb_intf intf;

task bfm_main;
intf=apb_config_db::vintf;

forever begin 
apb_config_db::gen2bfm.get(tx);
driver_logic(tx);
end
endtask


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
