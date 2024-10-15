//	--------------------------------------------
//      apb_config_db::gen2bfm.put(tx)   		apb_config_db::gen2bfm.get(tx);
//	generator					bfm
//	   |	-------------------------------------	  |
//	   |    | 		config_db	     |	  |
//	   | 	|				     |	  |
//	   |	|       |  |-------------|    |	     |	  |
//	   |----|------>|  |   gen2bfm_mb|    |------|--------
//		|       |  |put and get  |    |      |
//		|       |  |-------------|    |      |
//		|       |	        	     |
//	        |                                    |
//	 monitor|				     |	  scb
//		|       |  |-------------|    |	     |	  |
//	   |----|------>|  |   mon2scb_mb|    |------|--------
//		|       |  |-------------|    |      |
//		|       |		      |      |
//	        |------------------------------------|
//	---------------------------------------------
//apb_config_db is a class inside that gen2bfm mailbox is present we can
//access any property from a class via . or :: or = operator 
//class apb_config_db
//static mailbox gen2bfm
//endclass 
//apb_config_db::gen2bfm.put(tx)

class apb_config_db;
static virtual apb_intf vintf;
static mailbox gen2bfm=new();//we are creating the mailbox ,the word static coz we need a common mbox between gen n bfm
static mailbox mon2scb=new();
endclass 























