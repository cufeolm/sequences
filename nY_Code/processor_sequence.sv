`define t 8
class processor_transaction extends uvm_sequence_item;

  `uvm_object_utils(processor_transaction)
   rand logic [15:0] instrn;
   //rand opcode instrn;
   bit [7:0]pc;
   bit [15:0]inst_out;
   bit [15:0]reg_data;
   bit [1:0]reg_en;
   bit [2:0]reg_add;
   bit [15:0]mem_data;
   bit mem_en;
   bit [2:0]mem_add;
   rand reg [15:0]A[`t-1:0];


constraint data 
	{
	foreach (A[ii]) A[ii] dist {16'h0000:=1,
			[16'h0001 : 16'hFFFF]:=1,
			16'hFFFF:=1};
	}


constraint input_constraint
   {
	//Cosntraint to prevent EOF operation
      instrn[15:12] == {4'b0000};
	  instrn[11] inside {[1'b0:1'b1]};
	  instrn[10:9] inside {[2'b01:2'b11]};
	  instrn[8:0] inside {[9'b000000000:9'b111111111]};
   }
  function new (string name = "");
    super.new(name);
  endfunction

endclass: processor_transaction


class inst_sequence extends uvm_sequence#(processor_transaction);

  `uvm_object_utils(inst_sequence)

  function new (string name = "");
    super.new(name);
  endfunction

  logic [15:0] inst;
  //opcode inst;
//processor_transaction req;
  task body;
    
      req = processor_transaction::type_id::create("req");

      start_item(req);

      if (!req.randomize()) begin
        `uvm_error("Instruction Sequence", "Randomize failed.");
      end
     inst = req.instrn;

      finish_item(req);
    
  endtask: body

endclass: inst_sequence



class processor_sequence extends uvm_sequence#(processor_transaction);

  `uvm_object_utils(processor_sequence)

  function new (string name = "");
    super.new(name);
  endfunction

  inst_sequence inst_seq;

  task body;
    
	//LOOP relative to use case (say 256)
     for(int i =0;i<10;i++) 
     begin
        inst_seq = inst_sequence::type_id::create("inst_seq");
        inst_seq.start(m_sequencer);
     end
     
  endtask: body

endclass: processor_sequence


