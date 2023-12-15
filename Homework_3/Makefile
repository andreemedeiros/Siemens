# Makefile para execução do comando 'xrun'
XRUN = xrun -sv

# Alvo padrão
all: simulate

# Alvo para executar a simulação
simulate:
	$(XRUN) testbench.sv top.sv

# Alvo para limpar arquivos gerados pela simulação
clean:
	rm -rf INCA_libs
	rm -f simulation.vpd simulation.fsdb

.PHONY: all simulate clean

