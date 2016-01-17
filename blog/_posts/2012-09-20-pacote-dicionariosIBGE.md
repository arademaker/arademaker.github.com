---
layout: post
title: Pacote R dicionariosIBGE
tags: 
 - R
 - datasets
---

Disponibilizei hoje no github e submeti para o CRAN a versão 1.5 do
pacote [dicionariosIBGE](https://github.com/arademaker/dicionariosIBGE/).
Este pacote contém os dicionários das principais pesquisas do
[IBGE](http://www.ibge.gov.br/): PNAD (1983-2009), POF (1987-1996) e
PME. Também incluimos nesta versão variáveis adicionais com rótulos
para as variáveis categóricas de cada pesquisa.

Nesta nova versão, incorporamos a função `le.pesquisa` original do
pacote `IBGEPesq` que foi desenvolvido no IBGE mas nunca submetido ao
CRAN. O pacote `IBGEPesq` é distribuído pelo IBGE nos CDs e DVDs
vendidos na [loja virtual do IBGE](http://loja.ibge.gov.br) e
disponibilizo no site do IBGE. Vide link "Leitura em R" na
[página da última PNAD](http://www.ibge.gov.br/home/estatistica/populacao/trabalhoerendimento/pnad2009/microdados.shtm).

Fizemos várias otimizações na função `le.pesquisa` original e
incluímos ainda um argumento extra para leitura dos rótulos das
variáveis categóricas. A partir desta versão do dicionariosIBGE, o
pacote `IBGEPesq` torna-se desnecessário para leitura dos microdados
das pesquisas do IBGE contempladas pelo dicionariosIBGE.

Observo, no entanto, que a novidade de disponibilizarmos os rótulos
para as variáveis categóricas e adaptarmos a função `le.pesquisa` para
usar os rótulos para construir factors ainda é
experimental. Pessoalmente, questiono sua utilidade em geral. Existem
variáveis categóricas cujos rótulos são realmente úteis. Por exemplo,
variáveis como a `UF` da tabela de PESSOA da PNAD de 2009. Certamente
trabalharmos com um factor com rótulo "Rio de Janeiro" ao invés de
apenas o valor 33 torna o manuseio dos dados mais fácil. No entanto,
existem variáveis categóricas como a `V2927` cujos rótulos são tão
grandes e verbosos que provavelmente não facilitam em nada o trabalho
com os dados. Vide:

    > rotpes2009[rotpes2009$cod == "V2927",]
           cod valor                                  rotulo
    1070 V2927     1                     Custaria muito caro
    1071 V2927     2                         Era muito longe
    1072 V2927     3                     Por falta de provas
    1073 V2927     4                         Demoraria muito
    1074 V2927     5 Cabia as outras partes iniciarem a acao
    1075 V2927     6    Por medo de outras partes envolvidas
    1076 V2927     7     por meio de mediacao ou conciliacao
    1077 V2927     8                 Nao acredita na justica
    1078 V2927     9  Nao sabia que podia utilizar a Justica
    1079 V2927    10                                  Outros

De qualquer modo, ao invés de usar os rótulos que distribuímos no
pacote, nada impede que os usuários do pacote de: (1) passarem para a
função `le.pesquisa` seus próprios data.frames com rótulos, bastando
fornecer um data.frame com os rótulos no formato esperado (três
colunas: cod, valor, rotulo); ou (2) passar o valor `NULL` para os
rótulos (default da função) retornando os dados como numéricos e/ou
string e não factors.

O pacote foi desenvolvido e testado no MacOS mas deve funcionar sem
problemas no Linux e Windows.

Finalmente, cabe destacar que desenvolvemos o pacote usando os
dicionários que encontramos nos CDs e DVDs disponíveis na FGV. Já
tivemos casos de diferentes CDs da mesma pesquisa, adquiridos em
diferentes momentos do IBGE, terem conteúdos diferentes (diferenças
nos dicionários e diferenças nos arquivos de dados). O IBGE parece
produzir os CDs e DVDs das pesquisas por demanda, o que pode explicar
as diferenças entre CDs da mesma pesquisa.

A falta de padrão do IBGE na distribuição dos arquivos das pesquisas é
um grande problema para os pesquisadores e atrabalha bastante nossa
iniciativa de facilitar a leitura dos dados do IBGE em R. Para
contornar os problemas, poderíamos tentar distribuir os dados do IBGE
já em formato RData, para carga no R diretamente. No entanto, além das
possíveis questões legais (não está claro no site do IBGE qual a
licença de uso adotada pelo IBGE), certamente a credibilidade dos
dados é maior se os dados são obtidos diretamente do site ou mídia do
IBGE.

