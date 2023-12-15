/*-----------------------------------------------------------------
Desenvolvedor : André Medeiros
Criação       : 26/10/23

Linkedin: <https://www.linkedin.com/in/andreemedeiros>
GitHub: <https://github.com/andreemedeiros>
-------------------------------------------------------------------
Descrição     : Resposta Homework 2, questão 2
-----------------------------------------------------------------*/

module testbench;

    // Sinais para o testbench
    reg clk = 0;
    reg rst = 1; // Inicialize o reset para 1
    wire [2:0] lights;
    integer time_unit = 10; // Para representar 10 segundos, assumimos cada unidade de tempo como 1 segundo.

    // Array associativo para o scoreboard
    bit state_visited[5:0];

    // Instância da máquina de estados
    LightControl light_controller(.clk(clk), .rst(rst), .lights(lights));

    // Monitora o estado atual e imprime quando ocorre uma transição
    always_ff @(posedge clk) begin
        if (light_controller.current_state != light_controller.next_state) begin
            state_visited[light_controller.current_state] = 1;
            $display("Estado Atual: %s", light_controller.current_state);
        end
    end

    // Gera um sinal de clock
    always begin
        #5 clk = ~clk; // Atraso de 5 unidades de tempo
    end

    // Gera um sinal de reset
    always begin
        if (rst == 0) begin
            rst = 1;
        end else if (clk == 1) begin
            rst = 0;
        end
    end

    // Encerra a simulação após 600 segundos
    initial begin
        #6000 $finish; // 6000 unidades de tempo (10 segundos cada)
    end

endmodule

