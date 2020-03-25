onerror quit
if [file exists "work"] {vdel -all}

vlib work
 
vlog +incdir+format tb_pkg.sv 

vlog top.sv
vsim top 
run -all
quit
