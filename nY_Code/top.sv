`include "uvm_macros.svh"
`include "mips_package.sv"
`include "processor_testbench_pkg.sv"
`include "dumm_pkg.sv"


module top;
  import uvm_pkg::*;
  import mips_package::*;
  import processor_testbench_pkg::*;
  import dumm_pkg::*;

  
  bit clk;
  
  //clock generation
  always #5
	begin
		clk = ~clk;
	//	$display("m-gpr[0]=%b",dut.RF.processor_if1.rf_data);
	end
  initial 
  begin
    clk = 0;
  end

 // Instantiate the interface
  processor_interface processor_if(clk);
  //processor_interface processor_ifb(clk);

 
	// Instantiate dut
  Main_Processor dut(
	.inst_in(processor_if.inst_in),
	.clk(processor_if.clk),
	.pc_out(processor_if.pc),
	.inst_out_tb(processor_if.inst_out),
	.wD_rf(processor_if.reg_data),
	.w_en(processor_if.reg_en),
	.aD_rf(processor_if.reg_add),
	.mem_data_tb(processor_if.mem_data),
	.mem_en_tb(processor_if.mem_en),
	.mem_add_tb(processor_if.mem_add)
	//.dut.RF.gpr(processor_if.rf_data)	
	);	
	
	// Instantiate binding signal
		//const integer num_dut_instances = 8;
	 //generate for(genvar i=0; i< 8; i++) begin 
		bind reg_file processor_interface processor_if(
		.clk(clk),
		.rf_data_0(gpr[0]),
		.rf_data_1(gpr[1]),
		.rf_data_2(gpr[2]),
		.rf_data_3(gpr[3]),
		.rf_data_4(gpr[4]),
		.rf_data_5(gpr[5]),
		.rf_data_6(gpr[6]),
		.rf_data_7(gpr[7])
		);
	 // end endgenerate
	 
  
  initial 
  begin
    
    // Place the interface into the UVM configuration database
    uvm_config_db#(virtual processor_interface)::set(null, "*", "processor_vif", processor_if);
	uvm_config_db#(virtual processor_interface)::set(null, "*", "processor_vifb", dut.RF.processor_if);

	

    // Start the test
    run_test();
  end

  initial begin
    $vcdpluson();
  end

endmodule
