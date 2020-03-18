vlog -f DUT.f
# vlog Processor/stg_final.v
# vsim stg_final
vlog top.sv -timescale=1ps/1ps
vlog processor_interface.sv -timescale=1ps/1ps
vsim top +UVM_TESTNAME=processor_test

run -all
