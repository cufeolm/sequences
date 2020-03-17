package leon_pkg;
   import uvm_pkg::*;
`include "uvm_macros.svh"
//`include "leon_traction.sv"
    typedef enum logic[15:0] {
                                add = 16'b0000x11xxxxxxxxx,
                                addsb = 16'b0000x10xxxxxxxxx,
                                addfb = 16'b0000x01xxxxxxxxx
                            } opcode;
	
	function cmd_transaction get_format (cmd_transaction k);
	leon_transaction ay;
	ay.op = k.inst[31:30];
		case (ay.op)
			2'b01 : 
					//call format1
					ay.disp30 = k.inst[29:0];
			2'b00 : begin
						ay.op2 = k.inst[24:22];
						case (ay.op2)
							3'b100,3'b000 :
							//sethi & no op & unimplemnted format 2
								begin
									ay.rd = k.inst[29:25];
									ay.imm22 = k.inst[21:0];
								end
							3b'010, 3b'110, 3b'111 :
							//branch & fp branch & co branch format 2
								begin
									ay.a = k.inst[29];
									ay.cond = k.inst[28:25];
									ay.disp22 = k.inst[21:0];
								end
							default: uvm_report_error("k.instruction", "k.instruction format not defined");
						end
					end
			2'b10, 2'b11 : begin
								ay.i = k.inst[13];
								ay.rd = k.inst[29:25];
								ay.op3 = k.inst[24:19];
								ay.rs1 = k.inst[18:14];
								if (ay.i)
								//format 3 register register
									begin	
										ay.asi = k.inst[12:5];
										ay.rs2 = k.inst[4:0];
									end
								else
								//format 3 register immediate
									begin
										ay.imm13 = k.inst[12:0];
									end
								end
							end
			default: uvm_report_error("k.instruction", "k.instruction format not defined");
		end
		if (!($cast(ay,k))) 
			$fatal(1,"failed to cast transaction to leon's transaction"); 
		return k;
	endfunction 
endpackage

