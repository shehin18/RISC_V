module Imm_gen (instruction, I);
input signed [31:0] instruction;

output reg signed [31:0] I;

always @(*) begin
    I = {{20{instruction[11]}}, instruction[31:20]}; //Immediate
end

endmodule