---
layout: post
title: Barras e Linhas no R
tags: 
 - R
 - blog
---

{{ page.title }}
================

Ontem um aluno me perguntou como produzir um gráfico de barras com
linhas. Minha primeira idéia foi recorrer a pacotes como
[Lattice](http://cran.r-project.org/web/packages/lattice/) ou
[ggplot2](http://had.co.nz/ggplot2/), imaginando tratar-se de um
gráfico pouco usual. Depois de um pouco de pesquisa, acabei
descobrindo que o gráfico em questão não é tão usual assim e pode ser
facilmente produzido com os comandos básicos de gráficos do R. 

Digamos que seus dados sejam uma data.frame composto por duas
variáveis.

{% highlight r %}
dados <- data.frame(a = sample(1:100,10), b = sample(1:100,10))
{% endhighlight %}

O que desejamos é representar no gráfico os valores da variável `a`
como barras e os valores da variável `b` como pontos conectados por
linhas. O comando abaixo produz o gráfico de barras e retorna um
vetor com as coordenadas `x` dos meios das barras produzidas.

{% highlight r %}
a <- barplot(dados$a, ylim = c(0,100))
{% endhighlight %}

Agora é fácil criar os pontos e linhas:

{% highlight r %}
points(a, dados$b, ylim= c(0,100))
lines(a, dados$b, ylim= c(0,100))
{% endhighlight %}

Image que seus dados são temporais, onde cada observação está
relacionada a uma ano. Pode-se incluir os anos como rótulos do eixo
"x" com o comando:

{% highlight r %}
axis(1, at = a, labels = 2000:2009)
{% endhighlight %}

![bar-and-line](/images/2010-11-18-fig.png "bar and line")

