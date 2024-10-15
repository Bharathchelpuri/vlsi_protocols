class apb_env;
apb_gen gen_h;
apb_bfm bfm_h;
apb_mon mon_h;
apb_scb scb_h;

function new();
gen_h=new();
bfm_h=new();
mon_h=new();
scb_h=new();
endfunction  

task env_main();
fork	
gen_h.gen_main();
bfm_h.bfm_main();
mon_h.mon_main();
scb_h.scb_main();
join 
endtask 

endclass
