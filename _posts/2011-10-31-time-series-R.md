---
layout: post
title: Gráficos de séries temporais no R
tag: R
---

# {{ page.title }}

Pergunta de dois alunos: como postar duas séries temporáis usando o
ggplot? Resolvi responder usando este post. Vou aproveitar então para
mostrar como postar séries temporáis usando o ggplot, lattice e o plot
padrão do R.

## Criando os dados

Para começar, criei um objeto série temporal conforme exemplo da função `ts`
do R. Este objeto na realidade é uma matriz, são três séries temporais
ou uma série temporal multivariável.

    > dados <- ts(matrix(rnorm(300), 100, 3), start=c(1961, 1), 
                  frequency=12)
    > dados[1:4,]
           Series 1   Series 2   Series 3
    [1,]  1.4165848  2.1049293  1.0155993
    [2,] -0.4264193 -0.2730903  0.8754992
    [3,]  0.5120809 -0.4023986  1.9757084
    [4,]  0.1375277 -0.5043973 -0.7795633


## Plot básico

Se usarmos o comando padrão de plot do pacote basic do R, temos o
seguinte plot.

    > plot(ts)

![plot-basic](/images/2011-10-31-plot-basic.png "plot basic")

Obviamente, neste e nos próximos exemplos, estou mostrando o uso mais
básico das funções, sem me preocupar com nenhum ajuste de formatação,
legenda, rótulos, cores etc.


## No pacote lattice

No pacote Lattice, temos a função xyplot que contém vários
parâmetros para geração do gráfico. Explorei apenas a forma de gerar
uma série por painel e todas as séries em um painel.

    > xyplot(dados)

![plot-lattice-1](/images/2011-10-31-plot-lattice-1.png "plot lattice")

    > xyplot(dados, superpose = TRUE) 

![plot-lattice-2](/images/2011-10-31-plot-lattice-2.png "plot lattice")

A página de help da função `xyplot` contém muito mais informação sobre
os demais parâmetros da função. A função `xyplot` também tem um método
específico para lidar com objetos da classe Zoo do pacote
[zoo](http://cran.r-project.org/web/packages/zoo/index.html). 

## No pacote ggplot

Finalmente, como fazer no ggplot? Este foi o mais difícil. Demorei
bastante a encontrar referências via google. As mais relevantes que
encontrei foram:

- [scale_date](http://had.co.nz/ggplot2/scale_date.html)
- [ggplot2: two time series with different dates](http://learnr.wordpress.com/2009/05/05/ggplot2-two-time-series-with-different-dates/)
- [Using ggplot, how to have the x-axis of time series plots set up automatically?](http://goo.gl/Kr5wP)
  
O último link é a dica de como transformar um objeto `ts` em um
data.frame:

    datas <- seq(as.Date(paste(c(start(dados),1), collapse="/")), 
                 by = "month", length.out = length(dados))
    dados.df <- data.frame(date = datas, value = dados)

E finalmente consegui plotar uma série das três com:

    > ggplot(data=dados.df) + geom_line(aes(date, value.Series.1))
    
![plot-ggplot](/images/2011-10-31-plot-ggplot-single.png "plot ggplot")
 
Para conseguir em um único gráfico as três séries temporais, tive mais
trabalho. Primeiro em transformar os dados em um data.frame que
pudesse ser entendido pelo ggplot.

    > tmp <- stack(dados.df, select = -1)
    > tmp$date <- dados.df[,1]
    
E finalmente, o novo plot:

    > ggplot(data=dados.df) + geom_line(aes(date, value.Series.1))
    
![plot-ggplot-multi](/images/2011-10-31-plot-ggplot-multi.png "plot ggplot")    

## Conclusão

Não existe pacote melhor ou pior, cada um é mais adequado para cada
situação. No particular problema de plotar multiplas séries temporais,
sem nenhuma dúvida, preferi a facilidade do lattice em lidar com
objetos `ts`.

