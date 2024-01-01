default:
	iverilog -o wave testbench.v
	vvp -n wave -lxt2

plot:
	gtkwave wave.vcd -S plt.tcl

clean:
	rm wave wave.vcd