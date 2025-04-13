# C to Python Compiler

## 🎯 Objetivo

Este projeto faz parte da disciplina **Compiladores 1** (FGA0003) na Universidade de Brasília.  
Inicialmente, construímos um **analisador léxico** usando **Flex** para ler um código simples em **C** e identificar os principais tokens.  
Agora, avançamos para a etapa de **análise sintática** (parser) usando o **Bison**, integrando o lexer ao parser.  
No futuro, o compilador traduzirá C para Python.

---

## 📁 Estrutura do Projeto

```
c2py/
├── input.c           # Código de exemplo em C
├── lexer.l           # Analisador léxico integrado (para o parser)
├── lexer_debug.l     # Versão de teste do analisador léxico (debug)
├── parser.y          # Gramática e regras do parser (Bison)
├── Makefile          # Script de build e execução
├── README.md         # Este documento
└── (.gitignore)      # Arquivo que lista os arquivos gerados a serem ignorados
```

> **Observação:**  
> Os arquivos gerados automaticamente (como `lex.yy.c`, `scanner`, `parser`, `parser.tab.c` e `parser.tab.h`) estão listados no `.gitignore` e não são versionados.

---

## ▶️ Como Executar

### Pré-requisitos

- WSL (Linux) ou Linux nativo
- `flex`, `gcc`, `bison` e `make` instalados:
  ```bash
  sudo apt update
  sudo apt install flex gcc bison make
  ```

### Passos

#### Para compilar e rodar o parser completo (lexer + parser):
```bash
make        # Compila o parser (integra lexer.l e parser.y)
make run    # Executa o parser com input.c
```

#### Para testar somente a análise léxica (modo debug):
```bash
make debug-lex    # Compila o lexer de debug (usando lexer_debug.l)
make run-debug    # Executa o lexer de debug com input.c
```

#### Para limpar os arquivos gerados:
```bash
make clean
```

---

## ✅ Tokens e Gramática (Resumido)

### Tokens Reconhecidos (pelo lexer integrado)

| Tipo         | Exemplo       | Token retornado        |
|--------------|---------------|------------------------|
| Palavra-chave| `int`         | `INT`                  |
| Palavra-chave| `main`        | `MAIN`                 |
| Palavra-chave| `if`          | `IF`                   |
| Palavra-chave| `return`      | `RETURN`               |
| Identificador| `foo`         | `IDENT`                |
| Número       | `42`          | `NUM`                  |
| Operador     | `=`           | `OP_ASSIGN`            |
| Operador     | `+`           | `OP_PLUS`              |
| Operador     | `>`           | `OP_GT`                |
| Símbolo      | `(`, `)`, `{`, `}`, `;` | `LPAREN`, `RPAREN`, `LBRACE`, `RBRACE`, `SEMI` |

### Gramática Resumida (definida em `parser.y`)

- **program:**  
  Define a função `main`.

- **function_decl:**  
  Reconhece a declaração da função `main` e chama o bloco (compound_stmt).

- **compound_stmt:**  
  Define um bloco composto por declarações e comandos, incluindo instruções `if` e `return`.

- **Outras regras:**  
  Incluem declarações (com ou sem atribuição) e expressões simples.

Ao rodar o parser com um exemplo de entrada, a saída deverá indicar o reconhecimento dos elementos sintáticos, como:
- "Função main definida corretamente."
- "Declaração com atribuição reconhecida."
- "Estrutura if reconhecida."
- "Retorno reconhecido."
- E, se tudo estiver correto: "Parsing concluído com sucesso!"

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

### Saída Esperada (para o parser)
```
Iniciando o parsing...
Função main definida corretamente.
Declaração com atribuição reconhecida.
Declaração com atribuição reconhecida.
Estrutura if reconhecida.
Retorno reconhecido.
Parsing concluído com sucesso!
```

> **Observação:**  
> A saída pode incluir mensagens adicionais definidas pelas ações semânticas nas regras do parser, conforme a implementação.

---

## 👥 Desenvolvedores

- Guilherme Soares
- Artur Rodrigues
- Danilo Carvalho