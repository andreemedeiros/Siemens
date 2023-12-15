/*-----------------------------------------------------------------
Desenvolvedor : André Medeiros
Criação       : 26/10/23

Linkedin: <https://www.linkedin.com/in/andreemedeiros>
GitHub: <https://github.com/andreemedeiros>
-------------------------------------------------------------------
Descrição     : Resposta Homework 2, questão 2

Para modificar o código da máquina de estados e o testbench para usar SystemVerilog,
vou converter os blocos always para always_ff para a máquina de estados e always_comb para a lógica de controle das luzes.
Além disso, vou adicionar um scoreboard no testbench para acompanhar todos os estados que a FSM entra.
-----------------------------------------------------------------*/


module LightControl(
    input wire clk,       // Sinal de clock
    input wire rst,       // Sinal de reset
    output wire [2:0] lights  // Saída das luzes (LC, LB, LA, RA, RB, RC)
);

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

    // Variável auxiliar para as luzes
    logic [2:0] lights_tmp;

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

    // Lógica de controle das luzes
    always_comb begin
        case (current_state)
            LC: lights_tmp = 3'b001;  // Central acesa
            LB: lights_tmp = 3'b010;  // Esquerda acesa
            LA: lights_tmp = 3'b100;  // Direita acesa
            RA: lights_tmp = 3'b001;  // Central acesa
            RB: lights_tmp = 3'b010;  // Esquerda acesa
            RC: lights_tmp = 3'b100;  // Direita acesa
            default: lights_tmp = 3'b000;  // Todas as luzes apagadas
        endcase
    end

    // Atribuição de lights fora do bloco always_comb
    assign lights = lights_tmp;

endmodule

