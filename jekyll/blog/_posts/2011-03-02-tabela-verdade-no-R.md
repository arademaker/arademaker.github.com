---
layout: post
title: Construindo tabelas verdade no R
latex: true
tags: 
 - R
 - blog
---

{{ page.title }}
================

Durante a preparação de alguns exercícios de lógica, me deparei com a
necessidade de construir tabelas verdade. Lembrando do pacote xtable
do R, pensei como seria construir uma tabela verdade usando o R. Minha
solução em R está no github, gist abaixo, com o exemplo de como seria
a tabela da expressão

$$\neg (a \lor b) \lor c$$

<script src="https://gist.github.com/852194.js"> </script>

Observem que a saída do primeiro comando xtable é bastante bizarra,
certamente um bug do pacote xtable. Editei a saída mantendo apenas o
início da tabela gerada e incluíndo "..." no final.

{% highlight r %}
xtable(tt)
{% endhighlight %}

{% highlight latex %}
% latex table generated in R 2.11.1 by xtable 1.5-6 package
% Wed Mar  2 23:18:40 2011
\begin{table}[ht]
\begin{center}
\begin{tabular}{rllll}
  \hline
 & a & b & c & ! (a $|$ b) $|$ c \\ 
  \hline
1 & c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE) & 
    c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE) & 
    c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE) & 
    c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE) \\ 
2 & c(FALSE, FALSE, TRUE, TRUE, FALSE, FALSE, TRUE, TRUE) & 
...
  \hline
\end{tabular}
\end{center}
\end{table}
{% endhighlight %}

Para fazer com que cada célula da tabela tivesse apenas o valor lógico
correspondente, não um vetor, converti o data.frame em caracteres
antes de usar o xtable. Minha solução original convertia em números,
Bruno Lopes me lembrou de converter em caracteres diretamente.

{% highlight latex %}
\begin{table}[ht]
\begin{center}
\begin{tabular}{llll}
  \hline
a & b & c & \~{} (a OR b) OR c \\ 
  \hline
FALSE & FALSE & FALSE & TRUE \\ 
  FALSE & FALSE & TRUE & TRUE \\ 
  FALSE & TRUE & FALSE & FALSE \\ 
  FALSE & TRUE & TRUE & TRUE \\ 
  TRUE & FALSE & FALSE & FALSE \\ 
  TRUE & FALSE & TRUE & TRUE \\ 
  TRUE & TRUE & FALSE & FALSE \\ 
  TRUE & TRUE & TRUE & TRUE \\ 
   \hline
\end{tabular}
\end{center}
\end{table}
{% endhighlight %}

