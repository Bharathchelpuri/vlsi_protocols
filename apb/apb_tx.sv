class apb_transaction;
rand bit [1:0] paddr; 
rand bit 	pselx; 
rand bit 	penable; 
rand bit 	pwrite; 
rand bit [1:0] pwdata; 
     bit 	pready; 
     bit [1:0] prdata; 
     bit 	pslave_error;

function void display();
	$display("##################################################################");
	$display("paddr      =%d",paddr);
	$display("pwdata     =%d",pwdata);
	$display("prdata     =%d",prdata);
	$display("penable    =%d",penable);
	$display("pselx      =%d",pselx);
	$display("pwrite     =%d",pwrite);
	$display("pready     =%d",pready);
	$display("pslave_error=%d",pslave_error);
endfunction 

function copy(output apb_transaction tx);
tx = new();
tx.paddr    	=paddr;
tx.pwdata   	=pwdata;
tx.pwrite   	=pwrite;
tx.penable  	=penable;
tx.pselx    	=pselx;
tx.prdata   	=prdata;
tx.pslave_error =pslave_error;
tx.pready   	=pready;
endfunction

endclass
