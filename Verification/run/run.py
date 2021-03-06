import os

s = """
[[[ welcome to GUVM user interface ]]]
please choose which dut to compile:
1- Riscy core (based on RISC-v ISA): enter --> 1 
2- Leon core (based on Sparcv8 ISA): enter --> 2
3- Amber core (based on ARM ISA): enter --> 3
any other input wil terminate the simulation
DUT: """;
while (1):
	
	g = raw_input(s);
	print g;
	if g == "1":
		os.system("vsim -c -do ../testing_riscy/run_riscy.do")
	if g == "11":
		os.system("vsim -c -do ../testing_riscy/run_tb.do")
	elif g == "2":
		os.system("vsim -c -do ../testing_leon/run_leon.do")
	elif g == "22":
		os.system("vsim -c -do ../testing_leon/run_tb.do")
	elif g == "3":
		os.system("vsim -c -do ../testing_amber/run_amber.do")
	elif g == "w":
		os.system("vsim -view vsim.wlf -do ../testing_riscy/wave.do")
	elif g == "w2":
		os.system("vsim -view vsim.wlf -do ../testing_leon/wave.do")
	elif g == "w3":
		os.system("vsim -view vsim.wlf -do ../testing_amber/wave.do")
	else:
		print("please enter a valid number")
		break;
		
	raw_input('Press any key to start again')
	os.system("cls")