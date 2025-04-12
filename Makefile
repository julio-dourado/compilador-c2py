# Nome dos executáveis
EXEC_LEX = scanner    # para testes de lexer (debug)
EXEC_PARSER = parser  # para o parser integrado (lexer.l + parser.y)

# Alvo padrão: compila o parser completo
all: $(EXEC_PARSER)

# ----- Regras para o lexer de debug (somente análise léxica) -----
debug-lex: lexer_debug.l
	@echo "Compilando lexer em modo debug..."
	flex lexer_debug.l
	gcc lex.yy.c -lfl -o $(EXEC_LEX)
	@echo "Executável $(EXEC_LEX) gerado para testes léxicos."

run-debug: $(EXEC_LEX)
	./$(EXEC_LEX) < input.c

# ----- Regras para o parser (com integração) -----
$(EXEC_PARSER): lexer.l parser.y
	@echo "Gerando parser com Bison..."
	bison -d parser.y
	@echo "Gerando scanner com Flex..."
	flex lexer.l
	@echo "Compilando lexer e parser..."
	gcc lex.yy.c parser.tab.c -lfl -o $(EXEC_PARSER)

run: $(EXEC_PARSER)
	./$(EXEC_PARSER) < input.c

# ----- Alvo de limpeza -----
clean:
	rm -f lex.yy.c $(EXEC_LEX) $(EXEC_PARSER) parser.tab.c parser.tab.h
