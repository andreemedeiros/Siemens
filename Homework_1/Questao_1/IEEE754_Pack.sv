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
  typedef logic [31:0] ieee754_single; // Ponto flutuante IEEE 754 (precisão única)
  localparam int EXP_BITS = 8;
  localparam int FRAC_BITS = 23;
  localparam int BIAS = 127;

  // Função para converter IEEE 754 para ponto flutuante real
  function real ieee754_to_real(ieee754_single x);
    // Implemente a conversão IEEE 754 para ponto flutuante real, se necessário
  endfunction

  // Função para converter ponto flutuante real para IEEE 754
  function ieee754_single real_to_ieee754(real x);
    // Implemente a conversão ponto flutuante real para IEEE 754, se necessário
  endfunction
endpackage
