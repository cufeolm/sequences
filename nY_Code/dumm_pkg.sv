package dumm_pkg;
	  import uvm_pkg::*;
	`include "uvm_macros.svh"
	//let add = 16'b0000000000000000;
    //let addsb = 16'b0000000000000000;
	//let addtst = 16'b0000000000000000;
	typedef enum logic[15:0] {
                                //no op =32'b00000001000000000000000000000000
                                //add = 16'b0000x11xxxxxxxxx,
                                //addsb = 16'b0000x10xxxxxxxxx,
                                //addfb = 16'b0000x01xxxxxxxxx
								addtst= 16'bxxxxxxxxxxxxxxxx
                            } ocasc;
endpackage