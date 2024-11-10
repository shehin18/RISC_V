module Reg (clk, rst, rd_reg1, rd_reg2, RegWrite, wr_reg, wr_data, rd_data1, rd_data2);
input clk, rst, RegWrite;
input [5:0] rd_reg1;
input [5:0] rd_reg2;
input [5:0] wr_reg;
input [31:0] wr_data;

output [31:0] rd_data1, rd_data2;

reg [31:0] Register [0:31];
integer i;

initial begin
Register [0] = 32'd0;
Register [1] = 32'd1;
Register [2] = 32'd6;
Register [3] = 32'd34;
Register [4] = 32'd5;
Register [5] = 32'd8;
Register [6] = 32'd2;
Register [7] = 32'd67;
Register [8] = 32'd56;
Register [9] = 32'd45;
Register [10] = 32'd50;
Register [11] = 32'd41;
Register [12] = 32'd24;
Register [13] = 32'd23;
Register [14] = 32'd24;
Register [15] = 32'd35;
Register [16] = 32'd46;
Register [17] = 32'd57;
Register [18] = 32'd68;
Register [19] = 32'd29;
Register [20] = 32'd30;
Register [21] = 32'd41;
Register [22] = 32'd52;
Register [23] = 32'd53;
Register [24] = 32'd44;
Register [25] = 32'd75;
Register [26] = 32'd56;
Register [27] = 32'd57;
Register [28] = 32'd48;
Register [29] = 32'd39;
Register [30] = 32'd80;
Register [31] = 32'd91;
end

always @(posedge clk) begin
    if(rst == 1'b1) begin
    for (i = 0; i < 32 ; i++) 
    Register[i] <= 32'h00000000;
    end
    else if(RegWrite == 1'b1)
    Register[wr_reg] <= wr_data;
end

assign rd_data1 = Register[rd_reg1];
assign rd_data2 = Register[rd_reg2];

endmodule