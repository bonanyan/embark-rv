default:
	iverilog -o wave testbench.v
	vvp -n wave -lxt2

soc:
	iverilog -o wave ../rtl/soc.v ../rtl/core.v ../rtl/memory.v

core:
	iverilog -o wave ../rtl/core.v

plot:
	gtkwave wave.vcd -S plt.tcl

clean:
	rm wave wave.vcd