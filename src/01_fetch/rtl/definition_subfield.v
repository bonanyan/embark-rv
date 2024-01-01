
// Instruction field definitions.
// RV32I opcode definitions:
`define OP_LUI      7'b0110111
`define OP_AUIPC    7'b0010111
`define OP_JAL      7'b1101111
`define OP_JALR     7'b1100111
`define OP_BRANCH   7'b1100011
`define OP_LOAD     7'b0000011
`define OP_STORE    7'b0100011
`define OP_REG      7'b0110011
`define OP_IMM      7'b0010011
`define OP_SYSTEM   7'b1110011
`define OP_FENCE    7'b0001111

// RV32I "funct3" bits. These select different functions with
// R-type, I-type, S-type, and B-type instructions.
`define F_JALR 		3'b000
`define F_BEQ 		3'b000
`define F_BNE 		3'b001
`define F_BLT 		3'b100
`define F_BGE 		3'b101
`define F_BLTU 		3'b110
`define F_BGEU 		3'b111
`define F_LB 		3'b000
`define F_LH 		3'b001
`define F_LW 		3'b010
`define F_LBU 		3'b100
`define F_LHU 		3'b101
`define F_SB 		3'b000
`define F_SH 		3'b001
`define F_SW 		3'b010
`define F_ADDI 		3'b000
`define F_SLTI 		3'b010
`define F_SLTIU 	3'b011
`define F_XORI 		3'b100
`define F_ORI 		3'b110
`define F_ANDI 		3'b111
`define F_SLLI 		3'b001
`define F_SRLI 		3'b101
`define F_SRAI 		3'b101
`define F_ADD 		3'b000
`define F_SUB 		3'b000
`define F_SLL 		3'b001
`define F_SLT 		3'b010
`define F_SLTU 		3'b011
`define F_XOR 		3'b100
`define F_SRL 		3'b101
`define F_SRA 		3'b101
`define F_OR 		3'b110
`define F_AND 		3'b111

// RV32I "funct7" bits. Along with the "funct3" bits, these select
// different functions with R-type instructions.
`define FF_SLLI 	7'b0000000
`define FF_SRLI 	7'b0000000
`define FF_SRAI 	7'b0100000
`define FF_ADD 		7'b0000000
`define FF_SUB 		7'b0100000
`define FF_SLL 		7'b0000000
`define FF_SLT 		7'b0000000
`define FF_SLTU 	7'b0000000
`define FF_XOR 		7'b0000000
`define FF_SRL 		7'b0000000
`define FF_SRA 		7'b0100000
`define FF_OR 		7'b0000000
`define FF_AND 		7'b0000000

// CSR definitions, for 'ECALL' system instructions.
// Like with other "I-type" instructions, the 'funct3' bits select
// between different types of environment calls.
`define F_TRAPS 	3'b000
`define F_CSRRW 	3'b001
`define F_CSRRS 	3'b010
`define F_CSRRC 	3'b011
`define F_CSRRWI 	3'b101
`define F_CSRRSI 	3'b110
`define F_CSRRCI 	3'b111
//Definitions for non-CSR 'ECALL' system instructions. These seem to
//use the whole 12-bit immediate to encode their functionality.
`define IMM_MRET    12'h302
`define IMM_WFI     12'h105
//ID numbers for different types of traps (exceptions).
`define TRAP_IMIS   1
`define TRAP_ILLI   2
`define TRAP_BREAK  3
`define TRAP_LMIS   4
`define TRAP_SMIS   6
`define TRAP_ECALL  11
// (etc...)