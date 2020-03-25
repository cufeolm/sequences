
class driver extends uvm_driver #(GUVM_sequence_item);
    `uvm_component_utils(driver)
 

    task run_phase(uvm_phase phase);
      GUVM_sequence_item cmd;
       forever begin : cmd_loop
          //shortint unsigned result;
         $display("driver have started");
          seq_item_port.get_next_item(cmd);
          $display("driver fetch");
          $display("inst is %h , %b , %d",cmd.inst,cmd.inst,cmd.inst);
          seq_item_port.item_done();
       end : cmd_loop
    endtask : run_phase
    
    function new (string name, uvm_component parent);
       super.new(name, parent);
    endfunction : new
    
 endclass : driver
 
 
 