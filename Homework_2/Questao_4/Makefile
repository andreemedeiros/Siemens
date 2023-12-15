# Makefile para compilar e executar o xrun com union.sv

# Nome do arquivo SV que você deseja compilar e executar
SV_FILE = union.sv

# Comando para compilar e executar
xrun:
	xrun -sv $(SV_FILE)

# Comando para limpar arquivos temporários
clean:
	rm -rf INCA_libs
	rm -f *.log
	rm -f *.key

# Comando padrão (xrun) quando você apenas digita 'make' no terminal
default: xrun

