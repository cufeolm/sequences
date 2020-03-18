`include "dumm_pkg.sv"

package processor_testbench_pkg;
  import uvm_pkg::*;
  import mips_package::*;
  import dumm_pkg::*;

  `include "processor_sequence.sv"
  `include "processor_driver.sv"
  `include "processor_monitor.sv"
  `include "processor_scoreboard.sv"
  `include "processor_subscriber.sv"
  `include "processor_agent.sv"
  `include "processor_env.sv"
  `include "processor_test.sv"
  
  function bit xis1 (logic[15:0] a,logic[15:0] b);
		logic x;
		x = (a == b);
		if (x === 1'bx)
			begin
				return 1'b1;
			end
		else
			begin
				return 1'b0;
			end
	endfunction : xis1

endpackage
  
