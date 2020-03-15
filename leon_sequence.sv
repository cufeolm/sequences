

class leon_sequence extends uvm_sequence #(leon_seq_item);
    `uvm_object_utils(leon_sequence);
    leon_seq_item command ;
    function new(string name = "leon_sequence");
       super.new(name);

    endfunction : new
 
    task body();
        command = leon_seq_item::type_id::create("command");
        
        //command.inst = 1;
        repeat(10) begin
            start_item(command);
            command.ran();
            finish_item(command);
            command = leon_seq_item::type_id::create("command");
        end
        
    endtask : body

    
 endclass : leon_sequence

/*
class leon_sequence extends uvm_sequence #(cmd_sequence_item);
    `uvm_object_utils(leon_sequence);
    cmd_sequence_item command ;
    function new(string name = "leon_sequence");
       super.new(name);

    endfunction : new
 
    task body();
        command = cmd_sequence_item::type_id::create("command");
        start_item(command);
        command.inst = 1;
        finish_item(command);
    endtask : body

    
 endclass : leon_sequence
 */
      