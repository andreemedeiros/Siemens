/*-----------------------------------------------------------------
Desenvolvedor : André Medeiros
Criação       : 26/10/23

Linkedin: <https://www.linkedin.com/in/andreemedeiros>
GitHub: <https://github.com/andreemedeiros>
-------------------------------------------------------------------
Descrição     : Resposta Homework 1, questão 1
-----------------------------------------------------------------*/


module TestBench;
  logic clk; // Sinal de relógio
  logic [63:0] operand1, operand2, result; // Aumente o tamanho dos operandos para double precision
  real float_operand1, float_operand2, float_result;

  import IEEE754_Pack::*; // Importe o pacote externo

  // Inicialize operand1 e operand2 com valores apropriados para double precision
  initial begin
    operand1 = 64'h3FF80000000000000; // Valor correspondente a 1.0 em ponto flutuante IEEE 754 double precision
    operand2 = 64'h4000000000000000; // Valor correspondente a 2.0 em ponto flutuante IEEE 754 double precision

    // Use as funções do pacote para converter os valores para ponto flutuante
    float_operand1 = ieee754_to_real(operand1);
    float_operand2 = ieee754_to_real(operand2);
  end

  // Instancie o módulo FloatingPointAdder e conecte o sinal de relógio
  FloatingPointAdder #(11, 52) adder ( // Ajuste os parâmetros para double precision
    .operand1(operand1),
    .operand2(operand2),
    .clk(clk),
    .result(result)
  );

  // Imprima resultados
  always_ff @(posedge clk) begin
    $display("operand1 (ponto flutuante) = %f", float_operand1);
    $display("operand2 (ponto flutuante) = %f", float_operand2);
    $display("result = %h", result);

    // Calcule o valor em ponto flutuante manualmente
    float_result = float_operand1 + float_operand2;
    $display("result (ponto flutuante) = %f", float_result);
  end

  initial begin
    // Inicie a simulação
    #10 $finish; // Finalize a simulação após um certo tempo (ajuste conforme necessário)
  end
endmodule

