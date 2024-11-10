module ALU (A, B, ALU_control, Zero, ALU_result);
input [31:0] A, B;
input [3:0] ALU_control;

output reg Zero;
output reg [31:0] ALU_result;

always @(*) begin
    case (ALU_control)
        4'b0000: begin
        Zero <= 0;
        ALU_result <= A & B;
        end
       
        4'b0001: begin
        Zero <= 0;
        ALU_result <= A | B;
        end

        4'b0010: begin
        Zero <= 0;
        ALU_result <= A + B;
        end

        4'b0110: begin
            if(A == B)
            Zero <= 1;
            else begin
            Zero <= 0;
            ALU_result <= A - B; end     
        end

        default: begin
        Zero <= 0;
        ALU_result <= A;
        end
    endcase
end
    
endmodule