module Program_Counter (PC_out, PC_in, clk, rst);
input clk, rst;
input [31:0] PC_in;

output reg [31:0] PC_out;

always @(posedge clk) begin
    if(rst)
    PC_out <= 32'h00000000;
    else
    PC_out <= PC_in;
end

endmodule