- Homework 1

Guia para simulação com solução pronta:

1 - Utilizar o comando na máquina para abrir as ferramentas da cadence (ex: 'cds' 'load_cadence')

2 - Utilizar o comando 'make' ou 'xrun -sv LightControl.sv testbench.sv'

Questão 2:

Baixe a implementação da máquina de estado finito da luz traseira TTbird (modelo e testbench) da web do curso e converta-o para SystemVerilog, usando o apropriado Construções SystemVerilog, incluindo, mas não se limitando. As luzes são definidas como LC, LB, LA para esquerda e RA, RB, RC para direita.


- Use tipos enumerados para os estados
- Use sufixos de valor de tempo para valores de tempo e assuma uma A sequência de giro (ininterrupta) deve levar dois segundos
- Parâmetros do usuário e parâmetros locais onde/se apropriado
- No testbench imprima o nome do estado em que o FSM está em cada estado mudar
