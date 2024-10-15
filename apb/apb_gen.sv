class apb_gen;
apb_transaction tx;

task gen_main;
	repeat(5) 
	begin
	tx=new(); 
	tx.randomize with{tx.pwrite==1;};
	apb_config_db::gen2bfm.put(tx);
	
	tx=new();
	tx.randomize with{tx.pwrite==0;};
	apb_config_db::gen2bfm.put(tx);
	end
endtask 
endclass
