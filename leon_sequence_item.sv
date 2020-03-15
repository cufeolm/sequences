// now this file is the only non generic part in the sequencer chain
class leon_seq_item extends cmd_sequence_item;
	
	  `uvm_object_utils(leon_seq_item)
	  
	function new (string name = "");
		super.new(name);
	endfunction
  
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

		leon_seq_item temp_leon ; 
		cmd_sequence_item temp;
	function void ran(); // special kind of randomization 
		
		//inst = 32'b11000000010010000010000000000000 ; // LSB for leon 
		randomize();
		//$display("this inst :%d",inst);
		//$break();
		//op = 1 ;
		//cmd_sequence_item temp =  get_format(this.super.this);
		set_up();
		//$display("this is an lsi tests :inst=%d op=%d",inst,op);
		//temp.op ;
		$display("a sequance have been called and set up randomly");
	endfunction 
	function void set_up();
		temp =  get_format(inst);
		if(!$cast(temp_leon,temp)) `uvm_fatal("leon_sequence_item", "Failed to cast leon") ;
		//$display("this is an lsi test : inst = %d , op = %d",temp_leon.inst,temp_leon.op);
		//temp_leon.do_copy(this);
		do_copy(temp_leon);
	endfunction 



	// copied and edited portion of code
/*
				 op;
				 disp30;
				 rd;
				 op2;
				 imm22;
				 a;
				 cond;
				 disp22;
				 op3;
				 rs1;
				  i;		
				 asi;
				 rs2;
				 imm13;
				 opf;
*/
	
	 function void do_copy(uvm_object rhs);
		leon_seq_item RHS;
		assert(rhs != null) else
		  $fatal(1,"Tried to copy null transaction");
		super.do_copy(rhs);
		assert($cast(RHS,rhs)) else
		  $fatal(1,"Faied cast in do_copy");
		op= RHS.op;
		disp30= RHS.disp30;
		rd= RHS.rd;
		op2= RHS.op2;
		imm22= RHS.imm22;
		a= RHS.a;
		cond= RHS.cond;
		disp22= RHS.disp22;
		op3= RHS.op3;
		rs1= RHS.rs1;
		 i= RHS.i;		
		asi= RHS.asi;
		rs2= RHS.rs2;
		imm13= RHS.imm13;
		opf= RHS.opf;
	 endfunction : do_copy
	
	 function string convert2string();
		string            s;
		s ={ super.convert2string(),",",$sformatf(" op %d,disp30 %d,rd %d,op2 %d,imm22 
		%d,a %d,cond %d,disp22 %d,op3 %d,rs1 %d,i %d,
		asi %d,rs2 %d,imm13 %d,opf %d",
					  op,
					  disp30,
					  rd,
					  op2,
					  imm22,
					  a,
					  cond,
					  disp22,
					  op3,
					  rs1,
					   i,		
					  asi,
					  rs2,
					  imm13,
					  opf,
					  )};
		return s;
	 endfunction : convert2string
	 
endclass : leon_seq_item