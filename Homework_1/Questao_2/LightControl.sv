/*-----------------------------------------------------------------
Desenvolvedor : André Medeiros
Criação       : 26/10/23

Linkedin: <https://www.linkedin.com/in/andreemedeiros>
GitHub: <https://github.com/andreemedeiros>
-------------------------------------------------------------------
Descrição     : Resposta Homework 1, questão 2

Módulo máquina de estados luz traseira T-bird:

Este código descreve uma máquina de estados para o controle das luzes traseiras de um carro. 
As luzes são representadas como LC, LB, LA, RA, RB e RC.
A máquina de estados alterna entre esses estados em uma sequência de giro ininterrupta de dois segundos.
O testbench monitora o estado atual e imprime-o sempre que ocorre uma transição de estado.
-----------------------------------------------------------------*/

module LightControl(input wire clk,       // Sinal de clock
                    input wire rst,       // Sinal de reset
                    output wire [2:0] lights);  // Saída das luzes (LC, LB, LA, RA, RB, RC)

    // Definição dos estados como um tipo enumerado
    typedef enum logic [2:0] {
        LC, // Luzes esquerda: Central
        LB, // Luzes esquerda: Esquerda
        LA, // Luzes esquerda: Direita
        RA, // Luzes direita: Central
        RB, // Luzes direita: Esquerda
        RC  // Luzes direita: Direita
    } State;

    // Registros para os estados atual e próximo
    State current_state;
    State next_state;

    // Parâmetro de tempo para a sequência de giro de dois segundos
    parameter TURN_SEQUENCE_TIME = 2'd2;

    // Lógica de transição da máquina de estados
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            current_state <= LC;  // Estado inicial após reset
        end else begin
            current_state <= next_state;
        end
    end

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            next_state <= LC;  // Próximo estado inicial após reset
        end else begin
            // Lógica para transição de estados
            case (current_state)
                LC: next_state <= LB;  // Transição para LB
                LB: next_state <= LA;  // Transição para LA
                LA: next_state <= RA;  // Transição para RA
                RA: next_state <= RB;  // Transição para RB
                RB: next_state <= RC;  // Transição para RC
                RC: next_state <= LC;  // Transição de volta para LC
            endcase
        end
    end

    // Saída das luzes (Lógica de controle das luzes)
    assign lights = (current_state == LC) ? 3'b001 :  // Central acesa
                   (current_state == LB) ? 3'b010 :  // Esquerda acesa
                   (current_state == LA) ? 3'b100 :  // Direita acesa
                   (current_state == RA) ? 3'b001 :  // Central acesa
                   (current_state == RB) ? 3'b010 :  // Esquerda acesa
                   (current_state == RC) ? 3'b100 :  // Direita acesa
                   3'b000;  // Todas as luzes apagadas

endmodule

