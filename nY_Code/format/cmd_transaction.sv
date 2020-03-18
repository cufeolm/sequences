class cmd_transaction extends uvm_sequence_item;

  `uvm_object_utils(cmd_transaction)
   rand logic [31:0] inst;
	
  function new (string name = "");
    super.new(name);
  endfunction
  
  function randomize ();
	logic [31:0]temp;
	bit t = 1;
	while (t)
		temp = super.new randomize();
		case (temp)
			//valid instruction case statements is t = 0
		end
	end
endclass: processor_transaction