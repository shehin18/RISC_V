module Data_mem (clk, rst, addrs, wr_data, rd_data, MemWrite, MemRead);
input clk, rst, MemRead, MemWrite;
input [31:0] addrs, wr_data;

output [31:0] rd_data;

reg [31:0] Data_memory [0:63];

assign rd_data = (MemRead) ? Data_memory[addrs] : 32'h00000000;

always @(posedge clk) begin
    if(rst) begin
    for(i =0; i < 64; i++) begin
    Data_memory[i] <= 32'h00000000; end
    end
    else if(MemWrite)
    Data_memory[addrs] <= wr_data;
end

endmodule