# Sprint 1: Configuração Inicial e Definição da Linguagem

**Período:** 24/03/2025 - 22/04/2025  

## Objetivos

Essa sprint foi mais focada na preparação do terreno. A ideia era montar toda a base necessária para o projeto do compilador rodar bem, desde configurar o ambiente até entender melhor a parte da linguagem C que vamos traduzir para Python.

## Entregáveis Planejados

- Documento com os principais elementos da linguagem C (tokens, estruturas, exemplos)  
- Protótipo da gramática feito no **Bison** (ainda não funcional, mas bem encaminhado)  
- Ambiente de desenvolvimento funcionando para todo mundo do grupo  

## O que conseguimos fazer

### 1. Configuração do Ambiente

- [x] Instalamos tudo que era necessário (`flex`, `bison`, `gcc`, `make`)  
- [x] Criamos a estrutura de diretórios para organizar o projeto  
- [x] Subimos o repositório no Git e configuramos o controle de versão   

### 2. Documentação da Linguagem

- [x] Mapeamos os principais tokens da linguagem C que vamos suportar  
- [x] Escolhemos quais estruturas sintáticas vamos implementar primeiro  
- [x] Escrevemos exemplos de código C que vão servir para testar o compilador  
- [x] Resumimos a semântica das estruturas que vamos aceitar  

### 3. Protótipo da Gramática

- [x] Definimos os símbolos terminais e não‑terminais  
- [x] Começamos a montar as regras da gramática no Bison 
- [x] Planejamos como será o analisador léxico com flex  
- [x] Listamos as palavras‑chave e operadores que o compilador precisa entender  

### 4. Planejamento do Compilador

- [x] Rascunhamos a arquitetura geral do compilador  
- [x] Escolhemos as ferramentas e bibliotecas que vamos usar  
- [x] Estudamos como flex e bison se integram, já pensando na próxima etapa  

## Resultados Alcançados

- Ambiente pronto e funcionando (sem dor de cabeça para compilar!)  
- Escopo inicial da linguagem C definido para o compilador  
- Gramática no Bison já com estrutura básica  
- Makefile configurado  
- Terreno pronto para iniciar o analisador léxico na próxima sprint  

## Exemplo de Código Base

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

Esse código traz tudo que precisamos tratar:

- Função `main`  
- Declaração de variáveis com inicialização  
- Expressão aritmética simples  
- Estrutura condicional `if`  
- Comando `return`  
- Comentário (que precisa ser ignorado pelo léxico)  

## Dificuldades Encontradas

1. **Escopo da linguagem:** a linguagem C é grande; por isso limitamos o escopo do nosso compilador. 

## Lições Aprendidas

- Entendemos melhor como flex e bison trabalham juntos.  
- Aprendemos a montar um Makefile básico e a organizar o projeto.  
- Vimos a importância de definir bem o escopo da linguagem logo no início.   
 
