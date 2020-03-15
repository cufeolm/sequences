/*
   Copyright 2013 Ray Salemi

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/
package tb_pkg;
   import uvm_pkg::*;
   `include "uvm_macros.svh"
   
   `include "cmd_sequence_item.sv"
   `include "leon_sequence_item.sv"
   `include "leon_sequence.sv"
   //`include "mips_package.sv"
   `include "driver.sv"
   `include "test.sv"
/*
   function cmd_sequence_item get_format (cmd_sequence_item k);
      leon_seq_item ay;
      ay.op = k.inst[31:30];
         case (ay.op)
            2'b01 : 
                  //call format1
                  ay.disp30 = k.inst[29:0];
            2'b00 : begin
                     ay.op2 = k.inst[24:22];
                     case (ay.op2)
                        3'b100,3'b000 :
                        //sethi & no op & unimplemnted format 2
                           begin
                              ay.rd = k.inst[29:25];
                              ay.imm22 = k.inst[21:0];
                           end
                        3'b010, 3'b110, 3'b111 :
                        //branch & fp branch & co branch format 2
                           begin
                              ay.a = k.inst[29];
                              ay.cond = k.inst[28:25];
                              ay.disp22 = k.inst[21:0];
                           end
                        default: uvm_report_error("k.instruction", "k.instruction format not defined");
                     endcase
                  end
            2'b10, 2'b11 : begin
                           ay.i = k.inst[13];
                           ay.rd = k.inst[29:25];
                           ay.op3 = k.inst[24:19];
                           ay.rs1 = k.inst[18:14];
                           if (ay.i)
                           //format 3 register register
                              begin	
                                 ay.asi = k.inst[12:5];
                                 ay.rs2 = k.inst[4:0];
                              end
                           else
                           //format 3 register immediate
                              begin
                                 ay.imm13 = k.inst[12:0];
                              end
                           
                        end
            default: uvm_report_error("k.instruction", "k.instruction format not defined");
         endcase
         if (!($cast(ay,k))) 
            $fatal(1,"failed to cast transaction to leon's transaction"); 
         return k;
      endfunction 
*/
function cmd_sequence_item get_format (logic [31:0] inst);
   leon_seq_item ay;
   cmd_sequence_item k ; 
   k = new("k");
   ay = new("ay");
   ay.inst=inst;
   ay.op = inst[31:30];
      case (ay.op)
         2'b01 : 
               //call format1
               ay.disp30 = inst[29:0];
         2'b00 : begin
                  ay.op2 = inst[24:22];
                  case (ay.op2)
                     3'b100,3'b000 :
                     //sethi & no op & unimplemnted format 2
                        begin
                           ay.rd = inst[29:25];
                           ay.imm22 = inst[21:0];
                        end
                     3'b010, 3'b110, 3'b111 :
                     //branch & fp branch & co branch format 2
                        begin
                           ay.a = inst[29];
                           ay.cond = inst[28:25];
                           ay.disp22 = inst[21:0];
                        end
                     default: uvm_report_error("k.instruction", "k.instruction format not defined");
                  endcase
               end
         2'b10, 2'b11 : begin
                        ay.i = inst[13];
                        ay.rd = inst[29:25];
                        ay.op3 = inst[24:19];
                        ay.rs1 = inst[18:14];
                        if (ay.i)
                        //format 3 register register
                           begin	
                              ay.asi = inst[12:5];
                              ay.rs2 = inst[4:0];
                           end
                        else
                        //format 3 register immediate
                           begin
                              ay.imm13 = inst[12:0];
                           end
                        
                     end
         default: uvm_report_error("k.instruction", "k.instruction format not defined");
      endcase
      
      if (!($cast(k,ay))) 
         $fatal(1,"failed to cast transaction to leon's transaction"); 
      return k;
   endfunction 
endpackage : tb_pkg
   