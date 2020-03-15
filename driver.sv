
class driver extends uvm_driver #(cmd_sequence_item);
    `uvm_component_utils(driver)
 
    //virtual tinyalu_bfm bfm;
  
   /* function void build_phase(uvm_phase phase);
       //if(!uvm_config_db #(virtual tinyalu_bfm)::get(null, "*","bfm", bfm))
        // `uvm_fatal("DRIVER", "Failed to get BFM")
    endfunction : build_phase
    */
    task run_phase(uvm_phase phase);
      /*
        sequence_item cmd;
 
       forever begin : cmd_loop
          shortint unsigned result;
          seq_item_port.get_next_item(cmd);
          bfm.send_op(cmd.A, cmd.B, cmd.op, result);
          cmd.result = result;
          seq_item_port.item_done();
       end : cmd_loop
       */
       cmd_sequence_item cmd;
       leon_seq_item temp ; 
       forever begin : cmd_loop
          //shortint unsigned result;
         $display("driver have started");
          seq_item_port.get_next_item(cmd);
          $display("driver fetch");
          temp = new("templeon");
          //bfm.send_op(cmd.A, cmd.B, cmd.op, result);
          //cmd.result = result;
          
          if (! $cast(temp,cmd)) `uvm_fatal("DRIVER", "Failed to cast leon") ;

          //$display("Driver has command item inst : %d",cmd.inst);
          //$display("Driver has command item op : %d",cmd.op);
          //$display("Driver has leon item inst : %d",temp.inst);
          //$display("Driver has leon item op : %d",temp.op);
          // temp has all the set ups from leon type (this means interface can be passed these information)
          /*temp.do_copy(cmd);
          $display("Driver has leon item inst : %d",temp.inst);
          $display("Driver has leon item op : %d",temp.op);*/
          $display("Driver has leon item ",temp.convert2string());
          seq_item_port.item_done();
       end : cmd_loop
    endtask : run_phase
    
    function new (string name, uvm_component parent);
       super.new(name, parent);
    endfunction : new
    
 endclass : driver
 
 
 