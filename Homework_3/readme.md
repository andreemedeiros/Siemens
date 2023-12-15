- Homework 3:
  
Guia para simulação com solução pronta:

1 - Utilizar o comando na máquina para abrir as ferramentas da cadence (ex: 'cds' 'load_cadence')

2 - Utilizar o comando 'make' ou 'xrun -sv testbench.sv top.sv'

Questão:

Considere um sistema simples no qual existe um único processador “mestre” e um ou mais dispositivos “escravos”. Eles compartilham um barramento de dados paralelo síncrono, dois sinais de controle (WB e RB para barramento de gravação e barramento de leitura respectivamente), um sinal de handshake (Ack), um sinal de 8-bits de endereço que identifica exclusivamente o escravo que é o alvo da transação, e um bit de paridade único que fornece paridade para os dados. Os sinais são amostrados no relógio ascendente arestas.

Para transações de leitura, o mestre coloca o ID de destino de um dispositivo nas linhas de endereço e afirma RB. O alvo reconhece seu ID na próxima transição de clock e transfere o dados na transição de clock seguinte, afirmando Ack. Ao receber Ack o mestre trava os dados e de-asserts RB. Para transações de escrita, o mestre coloca o ID de destino de um dispositivo nas linhas de endereço, dados no barramento de dados e afirma WB. No próximo relógio edge, o dispositivo de destino trava os dados e afirma Ack. Ao receber Ack o mestre tri-states declara os dados barramento e de-asserts WB. 

Modele um sistema configurado com um dispositivo mestre e dois dispositivos escravos. Utilize uma interface com modports para mestre e escravo e fornece métodos de interface (tarefas) para leitura e escrevendo o barramento para que os módulos mestre e escravo não precisem fazer o handshake diretamente. Fornece uma função de interface para o remetente calcular a paridade dos dados. Forneça outro para o receptor verificar a paridade. A largura do ônibus deve ser parâmetro que pode ser substituído quando a interface é instanciada.

Você pode propor uma maneira melhor de lidar com a verificação de paridade? Você não precisa Implementá-lo.
