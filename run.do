vlog +incdir+format leon_pkg.sv
vlog leon_int.sv
vlog top.sv


set NoQuitOnFinish 1
onbreak {resume}


vsim top 
run -all



log /* -r

mem display top/dut/rf0/inf/u0/rfss/u0/rfd
mem save -format mti -outfile memfile0 top/dut/rf0/inf/u0/rfss/u0/rfd

quit
