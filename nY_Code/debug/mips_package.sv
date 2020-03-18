package mips_package;
   import uvm_pkg::*;
`include "uvm_macros.svh"
  // `ifdef riscy
      typedef enum logic[15:0] {
                                //no op =32'b00000001000000000000000000000000
                                add = 16'b0000x11xxxxxxxxx,
                                addsb = 16'b0000x10xxxxxxxxx,
                                addfb = 16'b0000x01xxxxxxxxx
                            } opcode;
   // `endif
endpackage