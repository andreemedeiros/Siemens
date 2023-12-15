/*-----------------------------------------------------------------
Desenvolvedor : André Medeiros
Criação       : 26/10/23

Linkedin: <https://www.linkedin.com/in/andreemedeiros>
GitHub: <https://github.com/andreemedeiros>
-------------------------------------------------------------------
Descrição     : Resposta Homework 3

Este módulo verifica a paridade dos dados de entrada e emite uma saída, parity_ok, que indica se a paridade está correta.
A expressão (data ^ parity) calcula o XOR entre os dados e o bit de paridade. Se o resultado for zero, isso significa que
a paridade está correta, e parity_ok é atribuído a 1. Caso contrário, parity_ok é definido como 0.
-----------------------------------------------------------------*/


module ParityChecker(
    input wire [7:0] data,  // Dados de entrada de 8 bits
    input wire parity,     // Bit de paridade de entrada
    output wire parity_ok  // Saída indicando se a paridade está correta
);
    assign parity_ok = (data ^ parity) ? 0 : 1;
endmodule

