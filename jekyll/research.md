---
layout: default
title: Research 
---

# {{ page.title }}

## Program Committee

### 2014

- http://www.coling-2014.org
- http://fois2014.inf.ufes.br

## Presentations

Processamento de Linguagem Natural em textos da História
Comptemporânea do Brasil: o projeto OpenWordnet-PT, FGV,
2012. ([PDF](/files/cpdoc-2012-slides.pdf),
[SlideShare](http://goo.gl/VelVo),
[url](http://cpdoc.fgv.br/noticias/eventos/03102012) )


## Research Areas

I am interested in the following research areas: 

- Logics (proof theory, model theory, automatic theorem provers etc)
- knowledge representation and reasoning
- Semantic Web
- Programming languages (specially funcional programming)

Some ideas of projects that I would like to work on:

- Ontology Alignment and Instance Matching: I would like to look again
  to previous work with Edward Hermann and Isabel Cafezeiro. Vide
  publications.
    
Below I present (in Portuguese) some proposal of thesis research that
I would be interested in supervise.

Em todas as propostas abaixo, estou interessado tanto nos aspectos
teóricos quanto práticos. Tenho especial interesse na implementação
das soluções na forma de bibliotecas ou sistemas opensource. Dentre as
linguagens de programação que conheço, tenho especial interesse em
Lisp e seus dialetos e [R](http://www.r-project.org/). As razões para
escolha de Lisp são várias, dentre elas:

- Uma linguagem madura e bastante poderosa. Sugiro a leitura de
  [Beating the Averages](http://www.paulgraham.com/avg.html) e
  [The roots of Lisp](http://www.paulgraham.com/rootsoflisp.html). Recentemente,
  dois novos livros sobre a linguagem fizeram grande sucesso:
  [Practical Common Lisp](http://www.gigamonkeys.com/book/) e
  [The Land of Lisp](http://landoflisp.com/). Isto aliado ao fato das
  linguagens funcionais voltarem a chamar grande atenção por seus
  benefícios em arquiteturas distribuídas.

- Existe grande demanda na comunidade Lisp por bibliotecas e
  ferramentas para trabalhar com RDF, OWL e outras tecnologias da Web
  Semântica. Existem congressos específicos de Lisp e Web Semântica
  que seriam fóruns naturais para publicações (vide
  [European Lisp Symposium](http://european-lisp-symposium.org/)).
  

## Dicionário Histórico Brasileiro (CPDOC)

O projeto do [DHBB](http://cpdoc.fgv.br/acervo/dhbb) começou a ser
desenvolvido no CPDOC-FGV em 1974. A primeira edição do DHBB em 1984
consistia em quatro volumes e 4.493 verbetes. Em 2010, uma nova versão
do Dicionário pôde ser oferecida na web, com acesso gratuito e aberto,
com 7.553 verbetes, sendo 6.584 de natureza biográfica e 969 verbetes
temáticos, relativos a instituições, eventos e conceitos de interesse
para a história do Brasil pós-1930.

No final de 2010, EMAp e CPDOC iniciaram um projeto conjunto chamado
MIST. O objetivo do projeto é melhorar a qualidade dos dados do CPDOC
e incrementar as possibilidades de busca e navegação pelas
informações. O projeto MIST logo foi desmembrado em 3 sub projetos em
função do formato das informações e competências da equipe da EMAp:
texto, som e imagens.

Na parte texto, onde estou envolvido, meu interesse é utilizar
técnicas de processamento de linguagem natural (NLP) para: extração de
entidades nomeadas nos verbetes do HDBB, link do DHBB com outras
fontes de dados como Wikipedia, "triplificação" do DHBB etc.

Utilizar NLP para textos em português, no entanto, requer ainda um
grande esforço de construção de bases de dados para a lingua
portuguesa, como WordNet, VerbNet, NOMLEX etc. Sem contar recursos
mais custosos como uma gramática do português. Com tais bases de
dados, técnicas de processamento usadas em outras linguas podem então
ser aproveitas também para processamento de textos em português.

Constituem assim possíveis temas de pesquisa neste contexto:

- Contribuir no projeto já iniciado da construção da WordNet
  brasileira, chamada WordNet-PT. Esta etapa envolve desafios como:
  desenvolver métricas para medir a qualidade da base, desenvolvimento
  de ferramentas para auxiliar no esforço colaborativo de traduação e
  avaliação da tradução da WordNet em inglês para a portuguesa.
  
- Idem para outras bases como VerbNet, SUMO, NOMLEX etc.

- Pesquisar o problema e desenvolver a extração de entidades nomeadas
  dos verbetes do DHBB com objetivo de: (1) descobrir links entre
  verbetes; (2) conectar o DHBB a outras fontes como a Wikipedia e
  outras ontologias como a MENTA.
  
Outros temas são possíveis de serem desenvolvidos.

## Semantic Lattes 

A [plataforma Lattes](http://lattes.cnpq.br/) é um sistema e banco de
dados desenvolvidos pelo CNPq para armazenar todos os currículos dos
pesquisadores brasileiros. Como todos os pedidos de financiamento à
agências de fomento à pesquisas, em todas as esferas de governo no
Brasil, atualmente exigem a apresentação do Lattes pelos pesquisadores
como parte das solicitações de financiamento, a plataforma tournou-se
um importante banco de dados com mais de 1 milhão de currículos vitae
cadastrados. Analisando os dados desta plataforma, pode-se obter um
importante panorama da pesquisa e pesquisadores no Brasil. Do ponto de
vista das instituições de pesquisa e ensino brasileiras, os Lattes de
seus pesquisadores constituem uma base de dados pronta para ser usada
para avaliação de desempenho e tomadas de decisões. O CNPq permite que
as instituições, após assinatura de um acordo, tenham acesso aos
currículos de seus pesquisadores. O desafio é, após a recuperação dos
dados, a consolidação, identificação de inconsistências e duplicatas e
correção dos erros. No entanto, todos estes desafios valem o esforço
se considerarmos o custo das instituições em tentarem desenvolver
sistemas de informação próprios que irão invariavelmente dobrar os
esforços dos pesquisadores na alimentação dos dados, gerando mais
inconsistências e possível baixa qualidade nos dados.

Consistituem possíveis temas de pesquisa nesta área:

- Melhorias no mapeamento do modelo de dados do LATTES para
  RDF. Atualmente, no projeto
  [Semantic Lattes](github.com/arademaker/SLattes) já temos boa parte
  dos dados dos CVs mapeados para RDF, utilizando ontologias
  conhecidas como: FOAF, BIBO e SKOS. Mas ainda restam áreas dos CVs
  não mapeadas.

- Desenvolver técnicas, algorítmos e softwares para melhorar a
  consolidação dos dados, identificação e relatório de
  inconsistências, redundâncias e outros problemas na qualidade dos
  dados.
  
- Implementar bibliotecas de software para mining dos dados agregados
  em RDF a partir de diversas fontes como: os CV Lattes, CAPES Qualis,
  [Geonames Ontology](http://www.geonames.org/) etc.
  

## Logics and Law

Lógicas descritivas clássicas têm sido amplamente utilizadas como base
para ontologias e inferências lógicas nos mais diversos domínios de
conhecimento. Uma ontologia é uma teoria lógica, isto é, um conjunto
de axiomas em uma linguagem lógica como ALC ou iALC. Não estamos
interessados na interpretação filosófica do termo. Estamos
particularmente interessados em um domínio específico, a inteligência
artificial voltada ao âmbito jurídico. Como em qualquer outro domínio,
a consistência é uma questão importante.  Entretanto, devido às
características normativas que lhes são intrínsecas, a consistência em
ontologias jurídicas é mais complexa que em outros domínios.

Preservar a consistência, isto é, ausência de contradições lógicas,
aparenta ser de mais difícil manutenção quando mais de uma lei pode
ser aplicada para julgar um mesmo caso, isso é, quando há conflito de
leis. Há alguns mecanismos para a resolução desse tipo de conflito,
como a determinação de foro privilegiado e jurisprudência. Na maioria
dos casos, isso se resolve através da determinação de uma hierarquia
de leis (precedência de leis). Mas mesmo com esses mecanismos, a
consistência ainda é o maior desafio nos sistemas jurídicos. Cada
nível da hierarquia precisa ser consistente e, como a consistência é
uma consequência direta de como se lida com a negação lógica, a
negação também é um grande problema nesses sistemas.

A negação e a a subsunção tem um papel decisivo na consistência de
ontologias. Uma semântica intuicionista adequada para a negação no
domínio jurídico surge ao se tomar os argumentos válidos,
individualmente, os habitantes da ontologia jurídica. Isso permite
lidarmos de forma elegante com situações de consistência jurídica,
como conflito de leis, tais quais os resolvidos pela análise de leis
do direito privado internacional.

Em colaboração com outros pesquisadores, tenho um projeto que visa
apresentar de forma resumida uma versão intuicionista da lógica
descritiva clássica
[ALC](http://en.wikipedia.org/wiki/Description_logic). Esta lógica,
denominada iALC, foi criada recentemente como extensão da
minha tese de doutorado. Fundamentada na teoria Kelseniana do Direito,
esta lógica vem sendo apresentada juntamente com aplicações ao Direito
Privado Internacional em diversos forums acadêmicos, incluindo
congressos de Lógica Híbrida, de Inteligência Artificial, Informática
e Direito. Neste projeto, discutem-se os fundamentos da teoria
jurídica do sistema apresentado e apresenta-se um exemplo de como
efetuar a análise de consistência de um ``conflito de leis no espaço''
utilizando o sistema dedutivo criado para iALC.

Constituem possíveis temas de pesquisa:

- Testar a abordagem e escalabilidade com o uso de casos reais que
  estão a disposição no site do Supremo Tribunal Federal, como estudos
  no âmbito de leis do Direito Internacional e verificar se a sentença
  é compatível com uma das possíveis de serem obtidas pela análise
  formal do caso jurídico.

- Investigar os chamados "casos difíceis", onde a aplicação de
  diferentes leis induzem ao impasse de uma sentença jurídica.

- Projetar e construir uma ferramenta de edição de prova de teoremas.

- Integrar a ferramenta de edição de prova de teoremas a um provador
  automático de teoremas.

- Projetar e construir um módulo para suporte a seleção de estratégias
  de provas.

- Projetar e construir um módulo para geração de explicação de provas
  produzidas pelo provador de teoremas.

- Integrar o provador a um editor de ontologias como, por exemplo, o
  Protégé.


## Outros Projetos 

Outros possíveis projetos estão relacionados a diversas idéias de
implementação de bibliotecas e pacotes para Lisp e R direta ou
indiretamente relacionados aos temas acima. Na medida do possivel,
tentarei futuramente enumerar cada uma das idéias que tenho.

  
## Comentários  
  
<div id="disqus_thread"></div>
<script type="text/javascript">
    var disqus_shortname = 'arademaker'; 

    (function() {
        var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
        dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
    })();
</script>
<noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>

  
