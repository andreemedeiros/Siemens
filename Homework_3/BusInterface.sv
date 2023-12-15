/*-----------------------------------------------------------------
Desenvolvedor : André Medeiros
Criação       : 26/10/23

Linkedin: <https://www.linkedin.com/in/andreemedeiros>
GitHub: <https://github.com/andreemedeiros>
-------------------------------------------------------------------
Descrição     : Resposta Homework 3

O módulo BusInterface é uma interface para comunicação de barramento com funcionalidades de escrita e leitura,
incluindo geração e verificação de paridade. Ele aceita sinais como relógio, dados do barramento, sinais de
escrita/leitura, endereço, Ack e fornece dados lidos e indicação de paridade correta. Além disso, ele instancia
os módulos ParityGenerator e ParityChecker para tratar a paridade dos dados. Este módulo define modports para
comunicação entre mestre e escravo e direciona os sinais apropriados para a verificação da paridade.
-----------------------------------------------------------------*/


`include "ParityChecker.sv" // Inclua o módulo ParityChecker
`include "ParityGenerator.sv" // Inclua o módulo ParityGenerator

module BusInterface #(parameter BUS_WIDTH = 8)(
    input wire clock,         // Sinal de relógio
    inout wire [BUS_WIDTH-1:0] data, // Barramento de dados
    input wire WB,            // Sinal de escrita
    input wire RB,            // Sinal de leitura
    input wire [7:0] addr,    // Linhas de endereço de 8 bits
    input wire Ack,           // Sinal de Acknowledgment
    output wire [BUS_WIDTH-1:0] read_data, // Dados lidos
    output wire parity_ok    // Saída indicando se a paridade está correta
);

    wire [7:0] slave_address;
    wire [7:0] write_address;
    wire [BUS_WIDTH-1:0] write_data;
    wire write_enable, read_enable;

    assign slave_address = (WB || RB) ? addr : 8'bZ;
    assign write_enable = WB && !RB;
    assign read_enable = RB && !WB;

    // Defina modports apropriados para esta interface
    modport master_port(
        input [BUS_WIDTH-1:0] data,
        input [7:0] address
    );

    modport slave_port(
        output [BUS_WIDTH-1:0] data,
        input [7:0] address
    );

    // Instancie o módulo ParityGenerator como um módulo
    ParityGenerator #(BUS_WIDTH) parity_gen (
        .data(data),
        .parity(parity)
    );

    // Instancie o módulo ParityChecker como um módulo
    ParityChecker #(BUS_WIDTH) parity_checker (
        .data(data),
        .parity(parity),
        .parity_ok(parity_ok)
    );

endmodule

