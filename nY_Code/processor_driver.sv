class processor_driver extends uvm_driver #(processor_transaction);

  `uvm_component_utils(processor_driver)

  virtual processor_interface processor_vif;
  virtual processor_interface processor_vifb;


  // Analysis port to broadcast input values to scoreboard
  uvm_analysis_port #(processor_transaction) Drv2Sb_port;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
bit drv_clk;
 
  function void build_phase(uvm_phase phase);
    // Get interface reference from config database
    if(!uvm_config_db#(virtual processor_interface)::get(this, "", "processor_vif", processor_vif)) begin
      `uvm_error("", "uvm_config_db::get failed")
    end
	if(!uvm_config_db#(virtual processor_interface)::get(this, "", "processor_vifb", processor_vifb)) begin
      `uvm_error("", "uvm_config_db::get failed")
    end
    drv_clk=1'b0;
    Drv2Sb_port = new("Drv2Sb",this);
  endfunction 
      
  task run_phase(uvm_phase phase);

    reg[15:0]mem[0:18];
    int count ;
//Set initial instructions.txt file
	mem[0]=16'h9A35;
 	mem[1]=16'h9A7F;
        mem[2]=16'h9A85;
        mem[3]=16'h9AC0;
        mem[4]=16'h9B0B;
        mem[5]=16'h9B73;
        mem[6]=16'h9BBC;
        mem[7]=16'h9BC1;
        mem[8]=16'h9C04;
        mem[9]=16'h9C40;
        mem[10]=16'h9C81;
        mem[11]=16'h9CEB;
        mem[12]=16'h9D11;
        mem[13]=16'h9D40;
        mem[14]=16'h9D82;
        mem[15]=16'h9DD4;
        mem[16]=16'h0000;
        mem[17]=16'h0000;
        mem[18]=16'h0000;
    // Now drive normal traffic
    forever begin
          @(processor_vif.driver_if_mp.driver_cb)
      begin 
		/*for(count=0;count < 8;count++) 
		begin
			seq_item_port.get_next_item(req);	  
				processor_vifb.rf_data[count] <= req.A ;
			seq_item_port.item_done();
		end*/

		seq_item_port.get_next_item(req);
			processor_vifb.rf_data <= req.A ;
			if (xis1(req.instrn,add))
			begin 
			$display("add_instruction");
			end
			else if (xis1(req.instrn,addfb))
			begin
			$display("add_first_byte_instruction");
			end
			else if (xis1(req.instrn,addsb))
			begin
			$display("add_second_byte_instruction");
			end
			processor_vif.driver_if_mp.driver_cb.inst_in <= req.instrn ;
			Drv2Sb_port.write(req);
		seq_item_port.item_done();
    	end
    end
  endtask

endclass: processor_driver


