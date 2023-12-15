/*-----------------------------------------------------------------
Desenvolvedor : André Medeiros
Criação       : 26/10/23

Linkedin: <https://www.linkedin.com/in/andreemedeiros>
GitHub: <https://github.com/andreemedeiros>
-------------------------------------------------------------------
Descrição     : Resposta Homework 1, questão 2
-----------------------------------------------------------------*/

//Modulo testbench para máquina de estados finito da luz traseira T-bird
module testbench;

    // Sinais para o testbench
    reg clk = 0;
    reg rst = 0;
    wire [2:0] lights;
    integer time_unit = 2; // Para representar 2 segundos, assumimos cada unidade de tempo como 1 segundo.

    // Instância da máquina de estados
    LightControl light_controller(.clk(clk), .rst(rst), .lights(lights));

    // Monitora o estado atual e imprime quando ocorre uma transição
    always @(posedge clk) begin
        $display("Estado Atual: %0s", light_controller.current_state);
    end

    // Gera um sinal de clock e de reset
    always begin
        #time_unit clk = ~clk;
        if (rst == 0) begin
            rst = 1;
        end else if (clk == 1) begin
            rst = 0;
        end
    end

    // Encerra a simulação após 6 segundos
    initial begin
        #12 $finish;
    end

endmodule
