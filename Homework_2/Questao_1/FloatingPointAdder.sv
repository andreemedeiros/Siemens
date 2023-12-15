/*-----------------------------------------------------------------
Desenvolvedor : André Medeiros
Criação       : 26/10/23

Linkedin: <https://www.linkedin.com/in/andreemedeiros>
GitHub: <https://github.com/andreemedeiros>
-------------------------------------------------------------------
Descrição     : Resposta Homework 1, questão 1

O módulo FloatingPointAdder tem a função de realizar a adição de dois números em formato de ponto flutuante 
seguindo o padrão IEEE 754.  

Neste contexto, o módulo FloatingPointAdder recebe dois operandos no formato IEEE 754 (que inclui mantissa e expoente)
e realiza a adição desses números. A operação é realizada em várias etapas, incluindo o alinhamento dos expoentes, 
a adição das mantissas, a normalização do resultado e o tratamento de casos de overflow ou underflow(Não são tratados 
na questão). O resultado é então fornecido na saída também no formato IEEE 754.
-----------------------------------------------------------------*/


// Inclua o pacote externo "IEEE754_Pack.sv" que contém funções de conversão entre IEEE 754 e ponto flutuante real.
`include "IEEE754_Pack.sv"

module FloatingPointAdder #(parameter EXP_BITS = 11, FRAC_BITS = 52) (
  input logic [63:0] operand1, // Entrada 1 (IEEE 754 double precision)
  input logic [63:0] operand2, // Entrada 2 (IEEE 754 double precision)
  input logic clk, // Sinal de relógio
  output logic [63:0] result // Saída (IEEE 754 double precision)
);
  logic [63:0] mantissa1, mantissa2, mantissa_sum;
  logic [EXP_BITS-1:0] exp1, exp2, exp_sum;
  logic carry;

  import IEEE754_Pack::*; // Importe o pacote externo

  always_ff @(posedge clk) begin
    // Converte operandos para formato de ponto flutuante
    mantissa1 = {1'b1, operand1[FRAC_BITS-1:0]};
    mantissa2 = {1'b1, operand2[FRAC_BITS-1:0]};
    exp1 = operand1[EXP_BITS+FRAC_BITS-1:FRAC_BITS];
    exp2 = operand2[EXP_BITS+FRAC_BITS-1:FRAC_BITS];

    // Passo 1: Compare os expoentes e alinhe as mantissas
    if (exp1 > exp2) begin
      mantissa2 = (mantissa2 << (exp1 - exp2)) | {63'b0};
      exp_sum = exp1;
    end else begin
      mantissa1 = (mantissa1 << (exp2 - exp1)) | {63'b0};
      exp_sum = exp2;
    end

    // Passo 2: Adicione as mantissas
    {carry, mantissa_sum} = mantissa1 + mantissa2;

    // Passo 3: Normalize a soma
    if (mantissa_sum[63]) begin
      mantissa_sum = (mantissa_sum << 1);
      exp_sum = exp_sum + 1;
    end

    // Passo 4: Overflow ou Underflow?
    if (exp_sum >= (EXP_BITS+2)'(BIAS + 1)) begin
      // Overflow
      // Lide com exceção aqui, se necessário
    end else if (exp_sum <= 0) begin
      // Underflow
      // Lide com exceção aqui, se necessário
    end

    // Passo 5: Arredonde a mantissa
    result = {exp_sum, mantissa_sum[FRAC_BITS-1:0]};

    // Passo 6: Verifique se ainda está normalizado
    if (mantissa_sum[62:0] != 63'b0) begin
      // Volte ao Passo 3, se necessário
    end
  end
endmodule

