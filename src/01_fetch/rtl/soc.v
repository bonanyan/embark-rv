
module embark_soc 
#(
    parameter MEM_DEPTH = 16,
    parameter PC_START_ADDR = 16'h0
)(
    input clock,
    input reset
);
// ----------------------------------------------
// Connections
// ----------------------------------------------
// core connections
wire [MEM_DEPTH-1:0]    imem_addr;
wire [31:0]             imem_rdata;

// ROM connections
wire [MEM_DEPTH-1:0]    addr;
wire [MEM_DEPTH-1:0]    q;

// ----------------------------------------------
// Instantiation
// ----------------------------------------------
// core
embarkrv #(
    .MEM_DEPTH (MEM_DEPTH)
    ,.PC_START_ADDR (PC_START_ADDR)
) ucore (
    .clock ( clock )
    ,.reset ( reset )
    ,.imem_addr(imem_addr)
    ,.imem_rdata( imem_rdata )
);

// Instruction ROM, pre-load the instruction in the 
// file "testCode.hex" in the same folder
ROM #(
    .MEM_DEPTH (MEM_DEPTH)
) urom (
    .clock ( clock )
    ,.addr ( imem_addr )
    ,.q ( imem_rdata )
);

endmodule