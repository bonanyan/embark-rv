`timescale 1ns / 1ns
// ----------------------------------------------
// *** random-access memroy
// ----------------------------------------------
module RAM_ByteAddressable
#(
    parameter MemDepthInBitWidth = 16
)(
    input clock,
    input we,
    input [31:0] d,
    output [31:0] q,
    input [MemDepthInBitWidth-1:0] addr
);

reg [31:0] mem_core [0:(2<<(MemDepthInBitWidth-2))-1];

// reset memory content to zeros
integer i;
initial begin
    for(i=0;i<(2<<MemDepthInBitWidth);i=i+1) begin
        mem_core[i] = 32'h0;
    end
end

// read
//change the output into reg form, then there is no 1-cycle read latency
//byte-addressable, address has to be multiple of 4
assign q = mem_core[addr>>2]; 

// write
always @(posedge clock) begin
    if(we) begin
        mem_core[addr>>2] <= d;
    end
end
    
endmodule

// // ----------------------------------------------
// // *** instruction memory
// // ----------------------------------------------
// module InstrROM 
// #(
//     parameter MemDepthInBitWidth = 16
// )(
//     input clock,
//     input we,
//     input [31:0] d,
//     output [31:0] q,
//     input [MemDepthInBitWidth-1:0] addr
// );

// reg [31:0] mem_core [0:(2<<(MemDepthInBitWidth-2))-1];

// // reset memory content to zeros
// integer i;
// initial begin
//     for(i=0;i<(2<<MemDepthInBitWidth);i=i+1) begin
//         mem_core[i] = 32'h0;
//     end
//     $readmemh("testCode.hex",mem_core);
// end

// // read
// //change the output into reg form, then there is no 1-cycle read latency
// //byte-addressable, address has to be multiple of 4
// assign q = mem_core[addr>>2]; 

// // no write
// // always @(posedge clock) begin
// //     if(we) begin
// //         mem_core[addr>>2] <= d;
// //     end
// // end
    
// endmodule



