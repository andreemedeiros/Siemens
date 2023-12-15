- Homework 1:

Guia para simulação com solução pronta:

1 - Utilizar o comando na máquina para abrir as ferramentas da cadence (ex: 'cds' 'load_cadence')

2 - Utilizar o comando 'make' ou 'xrun -sv FloatingPointAdder.sv TestBench.sv'


Questão:

Use SystemVerilog para modelar e testar um somador de ponto flutuante simples. O somador deve aceitar duas entradas no formato de ponto flutuante IEEE 754 (precisão simples) e produzir em sua saída a soma de precisão única dos números flutuantes IEEE 754 formato de ponto. Você não precisa implementar o arredondamento de ponto flutuante IEEE 754 métodos (usando bits redondos, de proteção e pegajosos); você pode arredondar para zero. Você não precisa lidar com números desnormalizados.

Um algoritmo para adição de ponto flutuante é fornecido abaixo.

	- 1: Compare os expoentes de dois números; mudar o número menor para o expoente das unidades à direita corresponderia ao expoente maior.
	- 2: Adicione os significados.
	- 3: Normalize a soma, deslocando para a direita e aumentando o expoente ou deslocando para a esquerda e decrementando o expoente.
	- 4: Deu Overflow ou Underflow?
		- Se sim >> excessão.
		- Se não >> vai pro item 5.
	- 5: arredondar o significativo para o número apropriado de bits.
	- 6: Ainda normalizado?
		- Se sim >> finaliza.
		- Se não >> volta para o item 3.

O formato de ponto flutuante IEEE 754 de precisão única é mostrado abaixo:

Faça uso de construções e expressões do SystemVerilog quando aplicável. Por exemplo:

	- Use um pacote para definições que você precisa compartilhar entre o módulo definindo o somador de ponteiro flutuante e qualquer modelo que possa usar o flutuante somador de ponteiro (por exemplo, um módulo de nível superior ou um testbench).
	- Use um typedef para criar um tipo de tipo para números de ponto flutuante IEEE 754.
	- Use parâmetros e parâmetros locais onde/se apropriado.

SystemVerilog fornece um tipo de dados shortreal que pode ser útil em seu testbench para gerar dados de teste. Você pode converter isso para um arbitrário de 32 Tbit valor com $shortrealtobits() e de volta com $bitstoshortreal().



