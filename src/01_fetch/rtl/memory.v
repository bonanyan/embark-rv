// ----------------------------------------------
// *** random-access memroy
// ----------------------------------------------
module RAM // ByteAddressable
#(
    parameter MEM_DEPTH = 16 // byte address lenth 2^16; 32b word address length is 2^14
)(
    input clock,
    input we,
    input [MEM_DEPTH-1:0] addr,
    input [31:0] d,
    output [31:0] q
);

reg [7:0] mem_core [0 : ( 1 << MEM_DEPTH ) - 1 ];

// reset memory content to zeros
integer i;
initial begin
    for(i=0;i<(1 << MEM_DEPTH);i=i+1) begin
        mem_core[i] = 8'h0;
    end
end

// read
//change the output into reg form, then there is no 1-cycle read latency
//byte-addressable, address has to be multiple of 4
assign q[31:0] = we? 32'd0 : {
    mem_core[{addr>>2,2'b11}],
    mem_core[{addr>>2,2'b10}],
    mem_core[{addr>>2,2'b01}],
    mem_core[{addr>>2,2'b00}]
    }; 
// assign q[31:0] = we? 32'd0 : mem_core[{addr>>2,2'b00}];

// write
always @(posedge clock) begin
    if(we) begin
        mem_core[{addr>>2,2'b00}] <= d[7:0];
        mem_core[{addr>>2,2'b01}] <= d[15:8];
        mem_core[{addr>>2,2'b10}] <= d[23:16];
        mem_core[{addr>>2,2'b11}] <= d[31:24];
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



