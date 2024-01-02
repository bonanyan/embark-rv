// ----timescale----
`timescale 1ns/1ns

// ----includes----
`include "../rtl/soc.v"
`include "../rtl/core.v"
`include "../rtl/memory.v"

// ----constants----
`define MEM_DEPTH 16
`define PC_START_ADDR 0

// ----start of testbench main----
module testbench;

initial begin            
    $dumpfile("wave.vcd");        //generate wave.vcd
    $dumpvars(0, testbench);    //dump all of the TB module data
end

// declarations
reg clock, reset;
integer i;
integer data [0:2<<14-1];

// clock
initial clock=0;
always #1 clock=~clock;

initial $monitor("i: %4d, pc: %4d, instr: %8h", i ,usoc.ucore.imem_addr, usoc.ucore.imem_rdata);

initial begin
    flag = 1;
    reset = 1;
    #2 reset = 0;
    for(i=0;i<4;i=i+1) begin
        #2 ;
    end
    
    /*test pass condition: 
    when pc=0, instr should be 76543210
    when pc=4, instr should be d2d2d2a5
    when pc=8, instr should be e16b85aa
    */
    #2 $finish;
end

embark_soc #(
    .MEM_DEPTH( `MEM_DEPTH )
    , .PC_START_ADDR( `PC_START_ADDR )
) usoc (
    .clock ( clock )
    ,.reset( reset )
);

endmodule
// end of testbench main