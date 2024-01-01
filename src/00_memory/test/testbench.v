`timescale 1ns/1ns
`include "../rtl/memory.v"

module testbench;

`define MEM_DEPTH 16

// clock
reg clock, we;
reg [15:0] addr;
reg [31:0] d;
wire [31:0] q;
integer i;
integer data [0:2<<14-1];
reg flag = 1; // is 1 if correct 

initial begin            
    $dumpfile("wave.vcd");        //generate wave.vcd
    $dumpvars(0, testbench);    //dump all of the TB module data
end

initial clock=0;
always #1 clock=~clock;


initial begin
    flag = 1;
    we = 1;

    for(i=0 ; i < ( 1 << `MEM_DEPTH ) ; i=i+4) begin
    // for(i=0 ; i < ( 1 << 4 ) ; i=i+4) begin
        #2 begin
            addr = i;
            data[i>>2] = $random;
            d = data[i>>2];
            // $display("addr: %3d: d:%h", addr, d);
        end
    end

    #2 we = 0;
    for(i=0 ; i < ( 1 << `MEM_DEPTH ) ; i=i+4) begin
    // for(i=0 ; i < ( 1 << 4 ) ; i=i+4) begin
        #2 begin
            addr = i;
            if(q!==data[(i>>2)-1] && i!=0) begin //next-cycle readout q
                $display("addr %3d: data:%h, q:%h", addr, data[i>>2] , q);
                flag = 0;
            end
        end
    end

    #2 if(flag==1) 
        $display("\n============Test Passed============\n");
    else
        $display("\n============Test Failed============\n");
    #2 $finish;
end

RAM u0 (
    .clock ( clock )
    ,.we ( we )
    ,.addr ( addr )
    ,.d ( d )
    ,.q ( q )
);

endmodule