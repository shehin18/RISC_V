module Control_unit (OPcode, Branch, MemRead, MemtoReg, ALU_Op, MemWrite, ALUSrc, RegWrite);
input [6:0] OPcode;

output reg Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
output reg [1:0] ALU_Op;

always @(*) begin
    case (OPcode)
        7'b0110011: begin //R-type
            ALUSrc <= 1'b0;
            MemtoReg <= 1'b0;
            RegWrite <= 1'b1;
            MemRead <= 1'b0;
            MemWrite <= 1'b0;
            Branch <= 1'b0;
            ALU_Op[1] <= 1'b1;
            ALU_Op[0] <= 1'b0;
        end

        7'b0000011: begin //Load instruction
            ALUSrc <= 1'b1;
            MemtoReg <= 1'b1;
            RegWrite <= 1'b1;
            MemRead <= 1'b1;
            MemWrite <= 1'b0;
            Branch <= 1'b0;
            ALU_Op[1] <= 1'b0;
            ALU_Op[0] <= 1'b0;
        end

        7'b0100011: begin //Store instruction
            ALUSrc <= 1'b1;
            MemtoReg <= 1'bx;
            RegWrite <= 1'b0;
            MemRead <= 1'b1;
            MemWrite <= 1'b0;
            Branch <= 1'b0;
            ALU_Op[1] <= 1'b0;
            ALU_Op[0] <= 1'b0;
        end

        7'b1100011: begin //Branch equal instruction
            ALUSrc <= 1'b0;
            MemtoReg <= 1'bx;
            RegWrite <= 1'b0;
            MemRead <= 1'b0;
            MemWrite <= 1'b0;
            Branch <= 1'b1;
            ALU_Op[1] <= 1'b0;
            ALU_Op[0] <= 1'b1;
        end

        default: begin
            ALUSrc <= 1'b0;
            MemtoReg <= 1'b0;
            RegWrite <= 1'b1;
            MemRead <= 1'b0;
            MemWrite <= 1'b0;
            Branch <= 1'b0;
            ALU_Op[1] <= 1'b1;
            ALU_Op[0] <= 1'b0;
        end
    endcase
end
    
endmodule