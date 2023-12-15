/*-----------------------------------------------------------------
Desenvolvedor : André Medeiros
Criação       : 26/10/23

Linkedin: <https://www.linkedin.com/in/andreemedeiros>
GitHub: <https://github.com/andreemedeiros>
-------------------------------------------------------------------
Descrição     : Resposta Homework 2, questão 4

O código é uma modificação da questão 3, porém possui uma função separada que aceita uma única
entrada do tipo que foi criado e imprime a MIPS instruções campos em Hexadecimal.
-----------------------------------------------------------------*/


// Definição de uma união chamada "MIPS_Instruction"
typedef union packed {
    struct packed {
        logic [6:0] opcode;  // Campo "opcode" com 7 bits no formato R
        logic [4:0] rs;      // Campo "rs" com 5 bits no formato R
        logic [4:0] rt;      // Campo "rt" com 5 bits no formato R
        logic [4:0] rd;      // Campo "rd" com 5 bits no formato R
        logic [4:0] shamt;   // Campo "shamt" com 5 bits no formato R
        logic [6:0] funct;   // Campo "funct" com 7 bits no formato R
    } r_format;
    struct packed {
        logic [6:0] opcode;  // Campo "opcode" com 7 bits no formato J
        logic [26:0] target; // Campo "target" com 27 bits no formato J
    } j_format;
    struct packed {
        logic [6:0] opcode;      // Campo "opcode" com 7 bits no formato I
        logic [4:0] rs;          // Campo "rs" com 5 bits no formato I
        logic [4:0] rt;          // Campo "rt" com 5 bits no formato I
        logic [16:0] immediate;  // Campo "immediate" com 17 bits no formato I
    } i_format;
} MIPS_Instruction;

// Função para imprimir instruções MIPS em hexadecimal
function void printMIPSInstruction(MIPS_Instruction instr);
    if (instr.r_format.opcode != 7'b0) begin
        $display("Instrução no formato R:");
        $display("Opcode: %h", instr.r_format.opcode);
        $display("Rs: %h", instr.r_format.rs);
        $display("Rt: %h", instr.r_format.rt);
        $display("Rd: %h", instr.r_format.rd);
        $display("Shamt: %h", instr.r_format.shamt);
        $display("Funct: %h", instr.r_format.funct);
    end else if (instr.j_format.opcode != 7'b0) begin
        $display("Instrução no formato J:");
        $display("Opcode: %h", instr.j_format.opcode);
        $display("Target: %h", instr.j_format.target);
    end else if (instr.i_format.opcode != 7'b0) begin
        $display("Instrução no formato I:");
        $display("Opcode: %h", instr.i_format.opcode);
        $display("Rs: %h", instr.i_format.rs);
        $display("Rt: %h", instr.i_format.rt);
        $display("Immediate: %h", instr.i_format.immediate);
    end
endfunction


// Módulo de teste
module testbench;
    MIPS_Instruction instruction; // Instância da união "MIPS_Instruction"

    initial begin
        // Definindo valores para a instância da união
        instruction.r_format.opcode = 7'b0000000;
        instruction.r_format.rs = 5'b00001;
        instruction.r_format.rt = 5'b00010;
        instruction.r_format.rd = 5'b00100;
        instruction.r_format.shamt = 5'b00011;
        instruction.r_format.funct = 7'b100100;

        // Chame a função para imprimir a instrução
        printMIPSInstruction(instruction);
        // Agora, os valores serão exibidos na saída.
    end
endmodule


