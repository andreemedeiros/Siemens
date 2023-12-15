/*-----------------------------------------------------------------
Desenvolvedor : André Medeiros
Criação       : 26/10/23

Linkedin: <https://www.linkedin.com/in/andreemedeiros>
GitHub: <https://github.com/andreemedeiros>
-------------------------------------------------------------------
Descrição     : Resposta Homework 3
-----------------------------------------------------------------*/


`timescale 1ns/1ps

module testbench;

    // Defina a largura do barramento como uma constante
    localparam BUS_WIDTH = 8; // Substitua 8 pelo valor apropriado

    reg clock; // Sinal de relógio
    reg WB;    // Sinal de escrita
    reg RB;    // Sinal de leitura
    reg [7:0] master_data; // Dados do mestre
    reg [7:0] slave1_data; // Dados do escravo 1
    reg [7:0] slave2_data; // Dados do escravo 2
    reg [7:0] master_address; // Endereço do mestre
    reg [7:0] slave1_address; // Endereço do escravo 1
    reg [7:0] slave2_address; // Endereço do escravo 2
    wire Ack;   // Sinal de Acknowledgment

    // Instanciando o módulo Top
    top top_module (
        .clock(clock),
        .master_data(master_data),
        .WB(WB),
        .RB(RB),
        .master_address(master_address),
        .Ack(Ack),
        .slave1_data(slave1_data),
        .slave2_data(slave2_data),
        .slave1_address(slave1_address),
        .slave2_address(slave2_address)
    );

    // Instancie o módulo Master
    Master #(BUS_WIDTH) master_module (
        .clock(clock),
        .master(master_port)
    );

    // Instancie o módulo Slave1
    Slave #(BUS_WIDTH) slave1_module (
        .clock(clock),
        .slave(slave_port)
    );

    // Instancie o módulo Slave2
    Slave #(BUS_WIDTH) slave2_module (
        .clock(clock),
        .slave(slave_port)
    );

    // Gerando o sinal de relógio
    always begin
        #5 clock = ~clock;
    end

    // Tarefa para escrever dados no barramento
    task write_data;
        // Espera pelo sinal de Ack
        while (!Ack) @(posedge clock);

        // Envia dados e endereço no barramento
        WB = 1;
        master_data = 8'hAA; // Exemplo de dados
        master_address = 8'h01; // Exemplo de endereço

        while (Ack) @(posedge clock);
        WB = 0;

        master_data = 8'h00; // Limpa os dados
        master_address = 8'h00; // Limpa o endereço
    endtask

    // Tarefa para ler dados do barramento
    task read_data;
        // Espera pelo sinal de Ack
        while (!Ack) @(posedge clock);

        // Envia o endereço no barramento para leitura
        RB = 1;
        master_address = 8'h02; // Exemplo de endereço

        while (Ack) @(posedge clock);

        // Lê dados do barramento
        RB = 0;

        while (!Ack) @(posedge clock);
        slave1_data = top_module.master_data; // Armazena os dados lidos

        master_address = 8'h00; // Limpa o endereço
    endtask

    initial begin
        // Inicialização das variáveis
        clock = 0;
        WB = 0;
        RB = 0;
        master_data = 8'h00;
        slave1_data = 8'h00;
        slave2_data = 8'h00;
        master_address = 8'h01;
        slave1_address = 8'h02;
        slave2_address = 8'h03;

        // Realiza operações de escrita e leitura
        write_data;
        read_data;

        // Encerra a simulação após algum tempo
        #100 $finish;
    end

    // Função para visualizar a onda no Xcelium
    initial begin
        $dumpfile("simulation.vcd");
        $dumpvars(0, testbench);
        $display("Iniciando simulação...");
        $monitor("clock = %b, Ack = %b", testbench.clock, Ack);
        $timeformat(-9, 1, " ns", 0);
        $stimeformat(-9, 1, " ns", 0);
        $stop;
    end

endmodule

