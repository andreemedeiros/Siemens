/*-----------------------------------------------------------------
Desenvolvedor : André Medeiros
Criação       : 26/10/23

Linkedin: <https://www.linkedin.com/in/andreemedeiros>
GitHub: <https://github.com/andreemedeiros>
-------------------------------------------------------------------
Descrição     : Resposta Homework 1, questão 1

Este código está definindo um pacote chamado IEEE754_Pack que contém definições e funções para a conversão entre 
números em ponto flutuante no formato IEEE 754 (precisão única) e números em ponto flutuante no formato real.

Este pacote fornece uma estrutura que pode ser usada para converter entre representações em ponto flutuante no formato 
IEEE 754 e representações em ponto flutuante no formato real. As funções ieee754_to_real e real_to_ieee754 ainda não estão
implementadas, mas são placeholders onde você pode adicionar a lógica necessária para realizar as conversões apropriadas.
-----------------------------------------------------------------*/


package IEEE754_Pack;
  typedef logic [63:0] ieee754_double; // Ponto flutuante IEEE 754 (double precision)
  localparam int EXP_BITS = 11;
  localparam int FRAC_BITS = 52;
  localparam int BIAS = 1023;

  // Função para converter IEEE 754 para ponto flutuante real (double precision)
  function real ieee754_to_real(ieee754_double x);
    real result;
    integer exp, i;
    result = 0.0;
    exp = x[EXP_BITS-1:0] - BIAS;
    result = 1.0;

    // Calcula o valor da mantissa
    for (i = 0; i < FRAC_BITS; i = i + 1) begin
      result = result + (x[FRAC_BITS+i] * 2.0**(-i-1));
    end

    // Aplica o sinal (bit mais significativo)
    if (x[63] == 1'b1)
      result = -result;

    // Aplica o expoente
    if (exp > 0) begin
      for (i = 0; i < exp; i = i + 1)
        result = result * 2.0;
    end else if (exp < 0) begin
      for (i = 0; i < -exp; i = i + 1)
        result = result * 0.5;
    end

    return result;
  endfunction

  // Função para converter ponto flutuante real para IEEE 754 (double precision)
  function ieee754_double real_to_ieee754(real x);
    ieee754_double result;
    integer exp, i;
    result = 0;
    exp = 0;

    // Lida com zero ou números muito próximos de zero
    if (x == 0.0) begin
      return 64'h0000000000000000; // Zero em IEEE 754 double precision
    end

    // Lida com números negativos
    if (x < 0) begin
      x = -x;
      result[63] = 1'b1; // Sinal negativo
    end

    // Normaliza o número e calcula o expoente
    while (x >= 2.0) begin
      x = x * 0.5;
      exp = exp + 1;
    end
    while (x < 1.0) begin
      x = x * 2.0;
      exp = exp - 1;
    end

    // Calcula o valor da mantissa
    for (i = 0; i < FRAC_BITS; i = i + 1) begin
      x = x * 2.0;
      if (x >= 1.0) begin
        result[FRAC_BITS+i] = 1'b1;
        x = x - 1.0;
      end
    end

    // Calcula o expoente deslocado
    exp = exp + BIAS;
    result[EXP_BITS-1:0] = exp;

    return result;
  endfunction
endpackage

