module Mux (sel, A, B, out);
input [31:0] A, B;
input sel;

output [31:0] out;

assign out = (sel) ? B : A;

endmodule