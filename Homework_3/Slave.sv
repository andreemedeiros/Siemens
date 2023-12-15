/*-----------------------------------------------------------------
Desenvolvedor : André Medeiros
Criação       : 26/10/23

Linkedin: <https://www.linkedin.com/in/andreemedeiros>
GitHub: <https://github.com/andreemedeiros>
-------------------------------------------------------------------
Descrição     : Resposta Homework 3

O módulo Slave opera em um barramento, aceitando um sinal de relógio e uma interface para escrita/leitura.
Ele mantém dados internos e um sinal Acknowledgment, implementando lógica de leitura e escrita. 
O módulo responde a comandos de escrita (WB) e fornece dados em resposta a comandos de leitura (RB),
enquanto mantém um sinal de Acknowledgment.
-----------------------------------------------------------------*/


module Slave #(parameter BUS_WIDTH = 8)(
    input wire clock,         // Sinal de relógio
    slave_intf slave          // Interface do escravo
);
    reg [BUS_WIDTH-1:0] data;  // Dados do escravo
    reg Ack = 0;              // Acknowledgment fixo para o escravo

    interface slave_intf;
    // Sinais para leitura
    wire [BUS_WIDTH-1:0] data;  // Dados disponíveis no escravo
    wire WB;  // Sinal de escrita
    wire RB;  // Sinal de leitura
    wire [7:0] address;  // Linhas de endereço de 8 bits

    // Declare outros sinais necessários para a interface do escravo, se houver
    endinterface

    // Implementação da lógica de leitura e escrita do escravo
    always @(posedge clock) begin
        if (slave.WB == 1'b1) begin
            if (slave.address == slave.slave_id) begin
                data <= slave.data;
                Ack <= 1'b1;
            end
        end else begin
            Ack <= 1'b0;
        end
    end

    assign slave.read_data = data;

    assign slave.Ack = Ack;
endmodule

