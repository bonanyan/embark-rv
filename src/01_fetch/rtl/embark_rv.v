
`include "definition_subfield.v"
`include "memory.v"

// RV32I
module embark_rv (
    input clock,
    output mem_we,
    output 
);

// *** Instruction Fetch (IF) Stage
reg [31:0] pc;
always @(posedge clk) begin
    pc <= pc + 4;
end
assign imem_addr = pc;
InstrROM imem (
    .clock ( clock )
    ,.we ( imem_we )
    ,.d ( imem_d )
    ,.q ( i_mem_q )
    ,.addr ( pc )
)
    
endmodule