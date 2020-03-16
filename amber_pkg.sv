package amber_pkg;
   import uvm_pkg::*;
`include "uvm_macros.svh"
//`include "amber_traction.sv"
    typedef enum logic[15:0] {
                                //no op =32'b00000001000000000000000000000000
                                add = 16'b0000x11xxxxxxxxx,
                                addsb = 16'b0000x10xxxxxxxxx,
                                addfb = 16'b0000x01xxxxxxxxx
                            } opcode;
	
	function cmd_transaction get_format (cmd_transaction k);
	amber_transaction ay;
	ay.cond = k.inst[31:28];
		case (k.inst[27:25])
			3'b000 :
					begin 
						if(k.inst[4] == 1'b0)
							begin
								if(k.inst[11:7] == 5'b00000)
									begin
										ay.rn = k.inst[19:16];
										ay.rd = k.inst[15:12];
										ay.rm = k.inst[3:0];
										ay.s = k.inst[20];
									end
								else
									begin
										ay.shift = k.inst[6:5];
										ay.shift_imm = k.inst[11:7];
										ay.rn = k.inst[19:16];
										ay.rd = k.inst[15:12];
										ay.rm = k.inst[3:0];
										ay.s = k.inst[20];
									end
							end
						else if (k.inst[7] == 1'b0)
							begin 
								ay.rn = k.inst[19:16];
								ay.rd = k.inst[15:12];
								ay.rm = k.inst[3:0];
								ay.s = k.inst[20];
								ay.shift = k.inst[6:5];
								ay.rs = k.inst[11:8];
							end
						else if (k.inst[24] == 1'b0)
							begin
								ay.rd = k.inst[19:16];
								ay.rn = k.inst[15:12];
								ay.rs = k.inst[11:8];
								ay.rm = k.inst[3:0];
								ay.s = k.inst[20];
								ay.a = k.inst[21];
							end
						else
							begin 
								ay.rn = k.inst[19:16];
								ay.rd = k.inst[15:12];
								ay.rm = k.inst[3:0];
								ay.b = k.inst[22];
							end
					end
			3'b001 :
					begin 
						ay.rn = k.inst[19:16];
						ay.rd = k.inst[15:12];
						ay.s = k.inst[20];
						ay.encode_imm = k.inst[11:8];
						ay.imm8 = k.inst[7:0];
					end
			3'b010 :
					begin
						ay.rn = k.inst[19:16];
						ay.rd = k.inst[15:12];
						ay.offset12 = k.inst[11:0];
						ay.p = k.inst[24];
						ay.u = k.inst[23];
						ay.b = k.inst[22];
						ay.w = k.inst[21];
						ay.l = k.inst[20];
					end
			3'b011 :
					begin
						ay.rn = k.inst[19:16];
						ay.rd = k.inst[15:12];
						ay.rm = k.inst[3:0];
						ay.p = k.inst[24];
						ay.u = k.inst[23];
						ay.b = k.inst[22];
						ay.w = k.inst[21];
						ay.l = k.inst[20];
						ay.shift = k.inst[6:5];
						ay.shift_imm = k.inst[11:7];
					end
			3'b100 :
					begin
						ay.rn = k.inst[19:16];
						ay.register_list = k.inst[15:0];
						ay.p = k.inst[24];
						ay.u = k.inst[23];
						ay.s = k.inst[22];
						ay.w = k.inst[21];
						ay.l = k.inst[20];
					end
			3'b101 :
					begin
						ay.l = k.inst[24];
						au.offset24 = k.inst[23:0];
					end
			3'b110 :
					begin
						ay.rn = k.inst[19:16];
						ay.crd = k.inst[15:12];
						ay.cphash = k.inst[11:8];
						ay.offset8 = k.inst[7:0];
						ay.p = k.inst[24];
						ay.u = k.inst[23];
						ay.n = k.inst[22];
						ay.w = k.inst[21];
						ay.l = k.inst[20];
					end
			3'b111 :
					begin
						if(k.inst[24] == 1'b0)
							begin
								if (k.inst[4] == 1'b0)
									begin
										ay.cp_opcode4 = k.inst[23:20];
										ay.crn = k.inst[19:16];
										ay.crd = k.inst[15:12];
										ay.cphash = k.inst[11:8];
										ay.cp = k.inst[7:5];
										ay.crm = k.inst[3:0];
									end
								else
									begin
										ay.cp_opcode3 = k.inst[23:21];
										ay.l = k.inst[20];
										ay.crn = k.inst[19:16];
										ay.crd = k.inst[15:12];
										ay.cphash = k.inst[11:8];
										ay.cp = k.inst[7:5];
										ay.crm = k.inst[3:0];
									end
							end
						else
							begin
								ay.ibc = k.inst[23:0];
							end
						
					end
			end		
		if (!($cast(ay,k))) 
			$fatal(1,"failed to cast transaction to leon's transaction"); 
		return k;
	endfunction 
endpackage

