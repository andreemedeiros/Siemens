- Homework 2
  
Guia para simulação com solução pronta:

1 - Utilizar o comando na máquina para abrir as ferramentas da cadence (ex: 'cds' 'load_cadence')

2 - Utilizar o comando 'make' ou 'xrun -sv LightControl.sv testbench.sv'

Questão 2:

Modificar o estado finito máquina de Homework 1 para usar o novo do SystemVerilog blocos Always_comb e always_ff as appropriate.

Depois de verificar o design modificado, faça uma cópia e execute o seguinte experimentos. Certifique-se de entregar ambos o modelo modificado correto tão bem como o modelos demonstrando seus experimentos abaixo. Quando descrevendo qualquer mensagem você  veja de seu sistemaVerilog ferramentas tenha certeza de copiar a mensagem exatamente e indicar  what tool (por nome e função, por exemplo “vlog compiler” ou “vsim simulator”) produzido  isto.

  a)	Modifique seu modelo para causar um estado ilegal a ser gerado (tenha certeza seu  testbench triggers this behavior).O que, se qualquer coisa, fazer o relatório de ferramentas?


  b) Modifique seu modelo para que haja pelo menos um caminho através do código no bloco Always_comb onde as saídas da lâmpada não são definidas. Quais mensagens, se algum, você entende? O que teria acontecido se você usasse um sempre bloqueio em vez de?

  c) Modifique seu testbench para que nem todos os estados sejam exercidos.  Adicione Código ao testbench to keep track of all states that the FSM has been dentro. No fim do relatório de simulação quaisquer estados que nunca foram inseridos. Dica: Crie um scoreboard com um array indexado por estado associativo.
