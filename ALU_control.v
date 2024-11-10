module ALU_control (ALU_Op, func7, func3, ALU_control_out);
input [1:0] ALU_Op;
input [31:25] func7;
input [14:12] func3;

output reg [3:0] ALU_control_out;

always @(posedge clk) begin
    case ({ALU_Op,func7,func3})
    12'b00xxxxxxxxxx: ALU_control_out <= 4'b0010;
    12'b01xxxxxxxxxx: ALU_control_out <= 4'b0110;
    12'b100000000000: ALU_control_out <= 4'b0010;
    12'b100100000000: ALU_control_out <= 4'b0110;
    12'b100000000111: ALU_control_out <= 4'b0000;
    12'b100000000110: ALU_control_out <= 4'b0010;
        default: ALU_control_out <= 4'b0000;
    endcase
end
    
endmodule