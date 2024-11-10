module PC_adder (prev_PC, nxt_PC);
input [31:0] prev_PC;

output [31:0] nxt_PC;

assign nxt_PC = prev_PC + 32'h00000004;

endmodule