

class generic_sequence extends uvm_sequence #(GUVM_sequence_item);
    `uvm_object_utils(generic_sequence);
    GUVM_sequence_item command,load1,load2,store ;
    function new(string name = "generic_sequence");
       super.new(name);

    endfunction : new
 
    task body();
        load1 = GUVM_sequence_item::type_id::create("load1");
        load2 = GUVM_sequence_item::type_id::create("load2");
        command = GUVM_sequence_item::type_id::create("command");
        store = GUVM_sequence_item::type_id::create("store");
        
        //command.inst = 1;
        //repeat(10) begin

        command.ran();
        load1.rf_load();


        start_item(load1);
        finish_item(load1);

        start_item(command);
        finish_item(command);
        

        command = GUVM_sequence_item::type_id::create("command");
        //end
        
    endtask : body

    
 endclass : generic_sequence

      