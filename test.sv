//  Class: test
//
   typedef uvm_sequencer #(cmd_sequence_item) sequencer;

class test extends uvm_test;
    `uvm_component_utils(test);

    //  Group: Config
    

    //  Group: Variables
    driver          driver_h;
    sequencer       sequencer_h;
    leon_sequence leon_sequence_h;
    //  Group: Functions
    function void build_phase(uvm_phase phase);
        /*  note: Do not call super.build_phase() from any class that is extended from an UVM base class!  */
        /*  For more information see UVM Cookbook v1800.2 p.503  */
        //super.build_phase(phase);
        sequencer_h  = new("sequencer_h",this);
        driver_h     = driver::type_id::create("driver_h",this);
        leon_sequence_h = new("leon_sequence_h");
    endfunction: build_phase

    //  Function: connect_phase
    function void connect_phase(uvm_phase phase);
        driver_h.seq_item_port.connect(sequencer_h.seq_item_export);
    endfunction 
    
    task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        $display("test have started ");
        leon_sequence_h.start(sequencer_h);
        phase.drop_objection(this);
    endtask: run_phase
    
    
    //  Constructor: new
    function new(string name = "test", uvm_component parent);
        super.new(name, parent);
    endfunction: new

    
endclass: test
