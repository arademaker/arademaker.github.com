---
layout: post
title: O problema dos galões
tags: 
 - Programacao
 - Maude
 - Problema
---

# {{ page.title }}

Na primeira prova do curso de [estrutura de dados](/CA-2012-1/) que
dei este ano, coloquei a seguinte questão para os alunos.

Nós temos 3 galões de tamanho 10, 7 e 4 litros. Os galões de 7 e 4
litros começam cheios e o galão de 10 litros vazio. Só podemos
realizar um tipo de operação com os galões: derramar todo o conteúdo
de um galão em outro, parando apenas quando o galão sendo derramado
ficar vazio ou o destino ficar cheio. Queremos saber se existe uma
sequência de operações que termine com 2 litros no galão de 7 ou 4
litros.

E pedia:

- Modele o problema como um problema de grafo, descrevendo
  precisamente a definição do grafo envolvido e descrevendo a solução
  em função do grafo.
  
- Qual algorítmo de grafo deverá ser usado?

Este é um problema clássico que pode ser encontrado em vários livros
de estrutura de dados e algorítmos (Ex 3.8 do Algorithms by Dasgupta,
Papadimitriou e Vazirani
[Amazon](http://www.amazon.com/Algorithms-Sanjoy-Dasgupta/dp/0073523402),
[site do livro](http://www.cs.berkeley.edu/~vazirani/algorithms.html),
[Wolfram](http://demonstrations.wolfram.com/WaterPouringProblem/)). Trata-se
de ver os estados do sistema (a quantidaade de líquido em cada galão)
como um nó de um grafo. As arestas representam as possíveis transições
de estado após transferência de líquido entre dois galões.

Um formalismo bem interessante para implementar a solução deste
problema é lógica de reescrita. Em particular, resolvi usar
[Maude](http://maude.cs.uiuc.edu/). Maude é uma implementação bastante
eficiente e conhecida de lógica de reescrita, o nome refere-se a
linguagem e ao sistema ao mesmo tempo.

A implementação em Maude é muito simples:

    mod GAL is
      inc INT .
    
      sorts Galon System .
      subsort Galon < System .
    
      op <_,_> : Int Int -> Galon .
      op __ : System System -> System [assoc comm id: null] . 
      op null : -> System .
    
      vars N1 N2 M1 M2 : Int .
    
      crl [transfer-1] :
         < N1 , M1 > < N2 , M2 > => 
         < 0 , M1 > < (N1 + N2) , M2 > 
       if N1 < (M2 - N2) .
    
      crl [transfer-2] :
         < N1 , M1 > < N2 , M2 > => 
         < (N1 - (M2 - N2)) , M1 > < M2 , M2 > 
       if N1 > (M2 - N2) .
    
      op initial : -> System .
      eq initial = < 0 , 10 > < 7 , 7 > < 4 , 4 > .
    endm

Trata-se de uma especificação algébrica do estado do sistema como um
multiset de galões onde cada galão é uma dupla de números inteiros:
primeiro componente é a quantidade de líquido e segundo a
capacidade. A operação `initial` serve apenas para criar uma constante
que representa o estado inicial do sistema. 

As duas regras de reescrita fazem deste módulo um módulo de sistema
ou, mais formalmente, uma etoria de reescrita. Estas regras
implementam as duas possibilidades de transferência de líquido entre
um galão e outro. Na primeira regra, todo o líquido é transferido de
um galão para outro esvaziando o galão origem. Na segunda, a
transferência é interrompida quando o galão destino torna-se
cheio. Isto poderia ainda ser simplificado para uso de apenas uma
regra, certo?!

O interessante de implementar em Maude é que as regras de reescrita
podem ser entendidas, computacionalmente, como transições de estado de
um sistema. Logicamente, as regras podem ser entendidas como regras de
inferência de um sistema de reescrita.

Na prática, podemos aplicar as reescritas de estado usando o comando
`rew` e realizar uma busca por estados a partir de um estado inicial
usando o comando `search`.

Para testarmos a implementação, podemos aplicar algumas regras a
partir do estado initial. Por exemplo, para aplicarmos 4 regras de
reescrita a partir do estado inicial usamos:

    Maude> rew [4] initial .
    rewrite [4] in GAL : initial .
    rewrites: 33 in 0ms cpu (0ms real) (131474 rewrites/second)
    result System: < 0,4 > < 4,10 > < 7,7 >

Note-se que não controlamos que regras são aplicadas (estratégia de
aplicação). Para encontrarmos a solução, usamos: 

    search initial =>* < 2 , X:Int > S:System such that X:Int < 10 .
	
Este comando acima efetua uma busca, a partir do estado inicial, por
algum estado atingido com zero ou mais transições (aplicações de
alguma das duas regras que definimos), por um estado onde exista algum
galão com dois litros e cuja capacidade seja menor que 10.

A resposta do sistema são 4 possíveis soluções:

    Solution 1 (state 16)
    states: 17  rewrites: 501 in 3ms cpu (3ms real) (139244 rewrites/second)
    S:System --> < 2,10 > < 7,7 >
    X:Int --> 4
    
    Solution 2 (state 18)
    states: 19  rewrites: 559 in 4ms cpu (4ms real) (127334 rewrites/second)
    S:System --> < 0,7 > < 9,10 >
    X:Int --> 4
    
    Solution 3 (state 19)
    states: 20  rewrites: 610 in 5ms cpu (5ms real) (119210 rewrites/second)
    S:System --> < 4,4 > < 5,10 >
    X:Int --> 7
    
    Solution 4 (state 20)
    states: 21  rewrites: 627 in 5ms cpu (5ms real) (112164 rewrites/second)
    S:System --> < 0,4 > < 9,10 >
    X:Int --> 7
    
    No more solutions.
    states: 21  rewrites: 721 in 6ms cpu (6ms real) (109824 rewrites/second)

Para examinarmos a primeira solução, pedimos para o sistema mostrar o
caminho, isto é, as reescritas executadas.

    Maude> show path 16 .
    state 0, System: < 0,10 > < 4,4 > < 7,7 >
    ===[ crl ... [label transfer1] . ]===>
    state 1, System: < 0,4 > < 4,10 > < 7,7 >
    ===[ crl ... [label transfer2] . ]===>
    state 4, System: < 0,4 > < 1,7 > < 10,10 >
    ===[ crl ... [label transfer2] . ]===>
    state 8, System: < 1,7 > < 4,4 > < 6,10 >
    ===[ crl ... [label transfer1] . ]===>
    state 12, System: < 0,4 > < 5,7 > < 6,10 >
    ===[ crl ... [label transfer2] . ]===>
    state 14, System: < 2,10 > < 4,4 > < 5,7 >
    ===[ crl ... [label transfer2] . ]===>
    state 16, System: < 2,4 > < 2,10 > < 7,7 >

O estado encontrado é onde o galão de 4 litros está com 2 litros, o
galão de 7 litros está completo e o galão de 10 litros está com 2
litros.

Bem legal, não acham!?

