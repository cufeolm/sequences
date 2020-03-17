package riscy_pkg;
   import uvm_pkg::*;
`include "uvm_macros.svh"
//`include "riscy_traction.sv"
    typedef enum logic[15:0] {
                                //no op =32'b00000001000000000000000000000000
                                add = 16'b0000x11xxxxxxxxx,
                                addsb = 16'b0000x10xxxxxxxxx,
                                addfb = 16'b0000x01xxxxxxxxx
                            } opcode;
	
	function cmd_transaction get_format (cmd_transaction k);
	riscy_transaction ay;
	ay.opcode = k.inst[6:0];
		case (ay.opcode)
			7'b0110111,7'b0010111 :
					begin 
						//U-type
						ay.immb31_12 = k.inst[31:12];
						ay.rd = kinst[11:7];
					end
			7'b1101111 :
					begin 
						//J-type
						ay.immb20 = k.inst[31];
						ay.immb10_1 = k.inst[30:21];
						ay.immb11 = k.inst[20];
						ay.immb19_12 = k.inst[19:12];
						ay.rd = k.inst[11:7];
					end
			7'b1100111,7'b0000011 :
					begin
						//I-type
						ay.immb11_0 = k.inst[31:20];
						ay.rs1 = k.inst[19:15];
						ay.funct3 = k.inst[14:12];
						ay.rd = k.inst[11:7];
					end
			7'b0010011:
					begin
						if ( (k.inst[14:12] == 3'b001) || (k.inst[14:12] == 3'b101))
							begin
								//I-type-shift
								ay.funct7 = k.inst[31:25];
								ay.shamt = k.inst[24:20];
								ay.rs1 = k.inst[19:15];
								ay.funct3 = k.inst[14:12];
								ay.rd = k.inst[11:7];
							end
						else
							begin
								//I-type
								ay.immb11_0 = k.inst[31:20];
								ay.rs1 = k.inst[19:15];
								ay.funct3 = k.inst[14:12];
								ay.rd = k.inst[11:7];
							end
					end
			7'b0001111:
					begin
						//I-type-fence
						ay.pred = k.inst[27:24];
						ay.succ = k.inst[23:20];
					end
			7'b1110011 :
					begin
						//I-type-csr
						ay.csr = k.inst[31:20];
						ay.rs1 = k.inst[19:15];
						ay.funct3 = k.inst[14:12];
						ay.rd = k.inst[11:7];
					end
			7'b1100011 :
					begin
						//B-type
						ay.rs1 = k.inst[19:15];
						ay.funct3 = k.inst[14:12];
						ay.immb12 = k.inst[31];
						ay.immb10_5 = k.inst[30:25];
						ay.rs2 = k.inst[24:20];
						ay.immb4_1 = k.inst[11:8];
						ay.immb11 = k.inst[7];
					end
			7'b0100011 :
					begin
						//S-type
						ay.immb11_5 = k.inst[31:25];
						ay.rs2 = k.inst[24:20];
						ay.rs1 = k.inst[19:15];
						ay.funct3 = k.inst[14:12];
						ay.immb4_0 = k.inst[11:7];

					end
			7'b0110011 :
					begin
						//R-type
						ay.funct7 = k.inst[31:25];
						ay.rs2 = k.inst[24:20];
						ay.rs1 = k.inst[19:15];
						ay.funct3 = k.inst[14:12];
						ay.rd = k.inst[11:7];
					end
			end		
		if (!($cast(ay,k))) 
			$fatal(1,"failed to cast transaction to leon's transaction"); 
		return k;
	endfunction 
endpackage

