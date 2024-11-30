module RISCV_top (clk, rst);
input clk, rst;

wire [31:0] inst, instruction_out, rd_data_A, rd_data_B, rd_data, wr_data, ALU_rslt, PC_nxt, PC_in, ALU_in, Imm, s1;
wire[3:0] ALU_Cnrl;
wire RegWrt, MemWrt, MemRd, Mem2Reg, Brch, Zero, ALU_Src, sel_1;
wire [1:0] ALU_Op;


Program_Counter PC(
.clk(clk),
.rst(rst),
.PC_in(PC_in),
.PC_out(inst)
); //Program Counter

Instruction_mem IM(
.rst(rst),
.instruction(instruction_out),
.read_address(inst)
); //Instruction Memory

Reg Registers(
.clk(clk),
.rst(rst),
.rd_reg1(instruction_out[19:15]),
.rd_reg2(instruction_out[24:20]),
.RegWrite(RegWrt),
.wr_reg(instruction_out[11:7]),
.wr_data(wr_data),
.rd_data1(rd_data_A),
.rd_data2(rd_data_B)
); //Registers

ALU ALU(
.A(rd_data_A),
.B(ALU_in),
.clk(clk),
.ALU_control(ALU_Cnrl),
.Zero(Zero),
.ALU_result(ALU_rslt)
); //ALU

Data_mem DM (
.clk(clk),
.rst(rst),
.addrs(ALU_rslt),
.wr_data(rd_data_B),
.rd_data(rd_data),
.MemWrite(MemWrt),
.MemRead(MemRd)
); //Data Memory

ALU_control ALU_Cnrl(
.ALU_Op(ALU_Op),
.func7(instruction_out),
.func3(instruction_out),
.ALU_control_out(ALU_Cnrl)
); //ALU Control

Imm_gen IMG(
.instruction(instruction_out),
.I(Imm)
);

Control_unit CU(
.OPcode(instruction_out[6:0]),
.Branch(Brch),
.MemRead(MemRd),
.MemtoReg(Mem2Reg),
.ALU_Op(ALU_Op),
.MemWrite(MemWrt),
.ALUSrc(ALU_Src),
.RegWrite(RegWrt)
); //Control Unit

PC_adder PC_aadr(
.prev_PC(inst),
.nxt_PC(PC_nxt)
);

Mux MUX1(
.sel(sel_1),
.A(PC_nxt),
.B(s1),
.out(PC_in)
);

Mux MUX2(
.sel(ALU_Src),
.A(rd_data_A),
.B(Imm),
.out(ALU_in)
);

Mux MUX3(
.sel(Mem2Reg),
.A(ALU_rslt),
.B(rd_data),
.out(wr_data)
);

and AND1(
.A(Brch),
.B(Zero),
.out(sel_1)
);

Adder Addr_1(
.in_1(inst),
.in_2(instruction_out[31:0]),
.sum(s1)
);

endmodule
