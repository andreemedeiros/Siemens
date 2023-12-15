/*-----------------------------------------------------------------
Desenvolvedor : André Medeiros
Criação       : 26/10/23

Linkedin: <https://www.linkedin.com/in/andreemedeiros>
GitHub: <https://github.com/andreemedeiros>
-------------------------------------------------------------------
Descrição     : Resposta Homework 3

O módulo Master opera em um barramento, aceitando um sinal de relógio e uma interface para leitura/escrita.
Ele fornece dados para escrita no barramento, lê dados do barramento, e verifica a paridade dos dados lidos,
indicando se a paridade está correta.
-----------------------------------------------------------------*/


module Master #(parameter BUS_WIDTH = 8)(
    input wire clock,         // Sinal de relógio
    master_intf master        // Interface do mestre
);
    
    interface master_intf;
    // Sinais para leitura
    wire [BUS_WIDTH-1:0] read_data;  // Dados lidos do escravo
    wire parity_ok;  // Sinal indicando se a paridade está correta após a leitura

    // Sinais para escrita
    wire [BUS_WIDTH-1:0] data;  // Dados a serem escritos no barramento
    wire WB;  // Sinal de escrita
    wire RB;  // Sinal de leitura
    wire [7:0] address;  // Linhas de endereço de 8 bits
    wire Ack;  // Sinal de Acknowledgment

    // Declare outros sinais necessários para a interface do mestre, se houver
    endinterface


endmodule

