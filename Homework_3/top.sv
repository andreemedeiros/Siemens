/*-----------------------------------------------------------------
Desenvolvedor : André Medeiros
Criação       : 26/10/23

Linkedin: <https://www.linkedin.com/in/andreemedeiros>
GitHub: <https://github.com/andreemedeiros>
-------------------------------------------------------------------
Descrição     : Resposta Homework 3

O módulo top define sinais de controle dados do mestre e escravos. Em seguida, ele cria instâncias dos
módulos Master e dois módulos Slave para simular a comunicação entre um mestre e dois escravos.
-----------------------------------------------------------------*/


`include "Master.sv"
`include "Slave.sv"

module top;
    // Declaração dos sinais
    reg clock;                  // Sinal de relógio
    reg WB;                     // Sinal de escrita
    reg RB;                     // Sinal de leitura
    reg [7:0] master_data;       // Dados do mestre
    wire Ack;                   // Sinal de Acknowledgment
    reg [7:0] master_address;   // Endereço do mestre
    reg [7:0] slave1_data;      // Dados do escravo 1
    reg [7:0] slave2_data;      // Dados do escravo 2
    reg [7:0] slave1_address;   // Endereço do escravo 1
    reg [7:0] slave2_address;   // Endereço do escravo 2

    // Instância do módulo Master
    Master #(8) master_module (
        .clock(clock),
        .master_data(master_data),
        .WB(WB),
        .RB(RB),
        .master_address(master_address),
        .Ack(Ack)
    );

    // Instância do módulo Slave para o escravo 1
    Slave #(8) slave1_module (
        .clock(clock),
        .slave(slave1_data) // Corrigido para passar slave1_data ao invés de WB e RB
    );

    // Instância do módulo Slave para o escravo 2
    Slave #(8) slave2_module (
        .clock(clock),
        .slave(slave2_data) // Corrigido para passar slave2_data ao invés de WB e RB
    );
endmodule


