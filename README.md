# C to Python Compiler - Analisador Léxico

## 🎯 Objetivo

Este projeto faz parte da disciplina **Compiladores 1** (FGA0003) na Universidade de Brasília.  
O objetivo desta etapa é construir um **analisador léxico** usando **Flex**, capaz de ler um código simples em **C** e identificar os principais tokens da linguagem.

Este será o primeiro módulo de um compilador que traduzirá C para Python.

---

## 📁 Estrutura do Projeto


```
c2py/
├── input.c       # Código de exemplo em C
├── lexer.l       # Arquivo com regras léxicas (Flex)
├── lex.yy.c      # Arquivo gerado automaticamente pelo Flex
├── scanner       # Executável gerado com GCC
├── Makefile      # Script de build e execução
└── README.md     # Este documento
```

## ▶️ Como Executar

### Pré-requisitos:

- WSL (Linux) ou Linux nativo
- `flex`, `gcc` e `make` instalados:
  ```bash
  sudo apt update
  sudo apt install flex gcc make
  ```

### Passos:

```bash
make        # Compila o analisador léxico
make run    # Executa com o input.c
make clean  # Remove arquivos gerados
```

---


## ✅ Tokens Reconhecidos

| Tipo         | Exemplo    | Token gerado           |
|--------------|------------|-------------------------|
| Palavra-chave| `int`      | `KEYWORD(int)`          |
| Identificador| `main`     | `IDENT(main)`           |
| Número       | `42`       | `NUM(42)`               |
| Operador     | `+`        | `OP(PLUS)`              |
| Símbolo      | `{`        | `SYM(LBRACE)`           |
| Comentário   | `// ...`   | Ignorado                |
| Comentário   | `/* ... */`| Ignorado                |
| Erro         | `@`        | `ERRO LÉXICO: ...`      |

---

## 🧪 Exemplo de entrada (`input.c`)

```c
int main() {
    int x = 10;
    int y = x + 2;
    // isso é um comentário
    if (y > 5) {
        return y;
    }
}
```

### Saída esperada:

```
KEYWORD(int) na linha 1
KEYWORD(main) na linha 1
SYM(LPAREN) na linha 1
SYM(RPAREN) na linha 1
SYM(LBRACE) na linha 1
KEYWORD(int) na linha 2
IDENT(x) na linha 2
OP(ASSIGN) na linha 2
NUM(10) na linha 2
SYM(SEMI) na linha 2
KEYWORD(int) na linha 3
IDENT(y) na linha 3
OP(ASSIGN) na linha 3
IDENT(x) na linha 3
OP(PLUS) na linha 3
NUM(2) na linha 3
SYM(SEMI) na linha 3
KEYWORD(if) na linha 5
SYM(LPAREN) na linha 5
IDENT(y) na linha 5
OP(GT) na linha 5
NUM(5) na linha 5
SYM(RPAREN) na linha 5
SYM(LBRACE) na linha 5
KEYWORD(return) na linha 6
IDENT(y) na linha 6
SYM(SEMI) na linha 6
SYM(RBRACE) na linha 7
SYM(RBRACE) na linha 8
```

---

## 👥 Desenvolvedores

- Guilherme Soares
- [adicione os nomes do grupo aqui]
