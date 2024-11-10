module Instruction_mem (instruction, read_address, rst);
input rst;
input [31:0] read_address;

output [31:0] instruction;

    reg [31:0] Ins_memory [0:63]; //64 registers of 32 bit each
integer i;

assign instruction = Ins_memory[read_address];

always @(posedge clk) begin
    if(rst == 1'b1) begin
        for (i = 0; i < 64; i++)
        Ins_memory[i] <= 32'h00000000;
    end
    else if(rst == 1'b0)
    Ins_memory[0] <= 32'b0000000_11001_01010_000_1010_0110011; // add x10, x10, x25
    Ins_memory[4] <= 32'b0000000_11001_01010_000_01010_0110011; // add x10, x10, x25
    Ins_memory[8] <= 32'b0000000_00000_01010_011_01001_0000011; // lw x9, 0(x10)
    Ins_memory[12] <= 32'b0000000_11000_01001_001_01100_1100011; // bne x9, x24, Exit
    Ins_memory[16] <= 32'b0000000_00001_10110_000_10110_0010011; // addi x22, x22, 1
    Ins_memory[20] <= 32'b1111111_00000_00000_000_01101_1100011; // beq x0, x0, Loop
end
    
endmodule
