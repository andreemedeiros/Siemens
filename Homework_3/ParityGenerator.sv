/*-----------------------------------------------------------------
Desenvolvedor : André Medeiros
Criação       : 26/10/23

Linkedin: <https://www.linkedin.com/in/andreemedeiros>
GitHub: <https://github.com/andreemedeiros>
-------------------------------------------------------------------
Descrição     : Resposta Homework 3

Este módulo gera o bit de paridade para os dados de entrada. O ^data calcula o
XOR bit a bit dos dados de entrada, resultando no bit de paridade.
-----------------------------------------------------------------*/


module ParityGenerator(
    input wire [7:0] data,  // Dados de entrada de 8 bits
    output wire parity     // Saída do bit de paridade
);
    assign parity = ^data;
endmodule

