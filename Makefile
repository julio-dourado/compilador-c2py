# Nome do executável
EXEC = scanner

# Alvo padrão
all: $(EXEC)

# Geração do executável a partir do lexer
$(EXEC): lexer.l
	flex lexer.l
	gcc lex.yy.c -lfl -o $(EXEC)

# Executar o scanner com um arquivo de entrada
run: $(EXEC)
	./$(EXEC) < input.c

# Limpeza dos arquivos gerados
clean:
	rm -f lex.yy.c $(EXEC)
