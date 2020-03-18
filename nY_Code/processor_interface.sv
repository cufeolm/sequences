interface processor_interface(
input clk,
logic [15:0]rf_data_0,
logic [15:0]rf_data_1,
logic [15:0]rf_data_2,
logic [15:0]rf_data_3,
logic [15:0]rf_data_4,
logic [15:0]rf_data_5,
logic [15:0]rf_data_6,
logic [15:0]rf_data_7
); 

//PC and Instruction word
   logic [7:0]pc;
   logic [15:0]inst_out;
   logic [15:0]inst_in;
//Register file Signals
   logic [15:0]reg_data;
   logic [1:0]reg_en;
   logic [2:0]reg_add;

//Data Memory Signals
   logic [15:0]mem_data;
   logic mem_en;
   logic [2:0]mem_add;
   
   
   logic [15:0]rf_data[7:0];
   
   assign rf_data[0] = rf_data_0;
   assign rf_data[1] = rf_data_1;
   assign rf_data[2] = rf_data_2;
   assign rf_data[3] = rf_data_3;
   assign rf_data[4] = rf_data_4;
   assign rf_data[5] = rf_data_5;
   assign rf_data[6] = rf_data_6;
   assign rf_data[7] = rf_data_7;
   
   
	clocking driver_cb @ (negedge clk);
		output inst_in;
	//	output rf_data;
	//	output karamellla;
	endclocking : driver_cb
	
  clocking monitor_cb @ (negedge clk);
	input pc;
	input inst_out;
	input reg_data;
	input reg_en;
	input reg_add;
	input mem_data;
	input mem_en;
	input mem_add;
	//input rf_data;
  endclocking : monitor_cb

  modport driver_if_mp (clocking driver_cb);
  modport monitor_if_mp (clocking monitor_cb);
  	
endinterface

