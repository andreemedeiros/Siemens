/*-----------------------------------------------------------------
Desenvolvedor : André Medeiros
Criação       : 26/10/23

Linkedin: <https://www.linkedin.com/in/andreemedeiros>
GitHub: <https://github.com/andreemedeiros>
-------------------------------------------------------------------
Descrição     : Resposta Homework 2, questão 3

O código define um typedef para uma união que é capaz de modelar os três formatos de instruções MIPS,
ou seja, os formatos R, J e I. O código segue a estrutura descrita no link de referência 
(https://en.wikibooks.org/wiki/MIPS_Assembly/Instruction_Formats) para a modelagem dos formatos de instrução. 
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

// Módulo de teste
module testbench;
    MIPS_Instruction instruction; // Instância da união "MIPS_Instruction"

    initial begin
        // Definindo valores para o formato R
        instruction.r_format.opcode = 7'b0000000;
        instruction.r_format.rs = 5'b00001;
        instruction.r_format.rt = 5'b00010;
        instruction.r_format.rd = 5'b00100;
        instruction.r_format.shamt = 5'b00011;
        instruction.r_format.funct = 7'b100100;

        // Definindo valores para o formato J
        instruction.j_format.opcode = 7'b0000100;
        instruction.j_format.target = 26'b11011001101010110010101010;

        // Definindo valores para o formato I
        instruction.i_format.opcode = 7'b0011000;
        instruction.i_format.rs = 5'b00110;
        instruction.i_format.rt = 5'b01001;
        instruction.i_format.immediate = 16'b1111111111111101;

        // Exibindo os valores das instruções no formato R
        $display("Instrução no formato R:");
        $display("Opcode: %b", instruction.r_format.opcode);
        $display("Rs: %b", instruction.r_format.rs);
        $display("Rt: %b", instruction.r_format.rt);
        $display("Rd: %b", instruction.r_format.rd);
        $display("Shamt: %b", instruction.r_format.shamt);
        $display("Funct: %b", instruction.r_format.funct);

        // Exibindo os valores das instruções no formato J
        $display("Instrução no formato J:");
        $display("Opcode: %b", instruction.j_format.opcode);
        $display("Target: %b", instruction.j_format.target);

        // Exibindo os valores das instruções no formato I
        $display("Instrução no formato I:");
        $display("Opcode: %b", instruction.i_format.opcode);
        $display("Rs: %b", instruction.i_format.rs);
        $display("Rt: %b", instruction.i_format.rt);
        $display("Immediate: %b", instruction.i_format.immediate);
    end
endmodule

