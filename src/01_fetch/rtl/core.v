
module embarkrv 
#(
    parameter MEM_DEPTH = 16,
    parameter PC_START_ADDR=16'h0
)(
    input clock,
    input reset,
    input [31:0] imem_rdata,
    output [MEM_DEPTH-1:0] imem_addr
);

// ----------------------------------------------
// *** instrution fetch
// ----------------------------------------------
reg [MEM_DEPTH-1:0] pc;
always @(posedge clock) begin
    if(reset) begin
        pc <= PC_START_ADDR;
    end
    else begin
        pc <= pc + 4;
    end
end
assign imem_addr = pc;

endmodule