import uvm_pkg::*;
`include "uvm_macros.svh"
class target_seq_item extends GUVM_sequence_item;

	  `uvm_object_utils(target_seq_item)
	logic [1:0]op;
	logic [29:0]disp30;
	logic [4:0]rd;
	logic [2:0]op2;
	logic [21:0]imm22;
	logic a;
	logic [3:0]cond;
	logic [21:0]disp22;
	logic [5:0]op3;
	logic [4:0]rs1;
	logic i;		
	logic [7:0]asi;
	logic [4:0]rs2;
	logic [12:0]imm13;
	logic [8:0]opf;
	function new (string name = "");
		super.new(name);
	endfunction
  


	function setup();
		get_format()
	endfunction

endclass : target_seq_item