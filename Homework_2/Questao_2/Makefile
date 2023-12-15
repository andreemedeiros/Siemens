# Makefile para executar o xrun com LightControl.sv e testbench.sv

# Defina as variáveis com os nomes dos arquivos
SRCS = LightControl.sv testbench.sv

# Nome do executável
SIM = simv

# Comando para compilar e simular
sim: $(SRCS)
	xrun -sv $(SRCS)

# Comando para executar a simulação
run: sim
	./$(SIM)

# Limpar os arquivos gerados
clean:
	rm -f $(SIM) *.vcd

.PHONY: sim run clean

