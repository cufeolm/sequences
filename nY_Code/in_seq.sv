class in_seq extends uvm_sequence_item;
   `uvm_object_utils(in_seq);

   function new(string name = "");
      super.new(name);
   endfunction : new
   
   rand reg [15:0]A;
   
   constraint data { A dist {16'h0000:=1, [16'h0001 : 16'hFFFF]:=1, 16'hFFFF:=1};}

   endclass : in_seq

class random_data extends uvm_sequence #(in_seq);
   `uvm_object_utils(random_data);
   
   in_seq data16;

   function new(string name = "random_data");
      super.new(name);
   endfunction : new
   


   task body();
         data16 = in_seq::type_id::create("data16");
         start_item(data16);
         assert(data16.randomize());
         finish_item(data16);
   endtask : body
endclass : random_data


class processor_data extends uvm_sequence#(in_seq);

  `uvm_object_utils(processor_data)

  function new (string name = "");
    super.new(name);
  endfunction

  random_data rand_data;

  task body;
    
	//LOOP relative to use case (say 256)
     for(int i =0;i<8;i++) 
     begin
        rand_data = random_data::type_id::create("rand_data");
        rand_data.start(m_sequencer);
     end
     
  endtask: body

endclass: processor_data