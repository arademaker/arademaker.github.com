---
layout: post
title: Lattes to BibTeX
tags: 
 - Lattes
 - package
 - XSLT
 - opensource
---

{{ page.title }}
================

Disponibilizei hoje online no github uma transformação do [Lattes](http://lattes.cnpq.br/) para
[BibTeX](http://en.wikipedia.org/wiki/BibTeX), vejam o repositório:

[http://github.com/arademaker/SLattes](http://github.com/arademaker/SLattes)

Eu acabei fazendo esta transformação por dois motivos. O primeiro para
meu uso pessoal, eu já estava querendo faz muito tempo conseguir gerar
um BibTex com minhas produções. O segundo foi como parte do projeto
Lattes@FGV. A idéia é que uma transformação dos dados do Lattes para
algum padrão de referências como o [XML/MODS da Biblioteca do Congresso](http://www.loc.gov/standards/mods/)
Americano, me ajuda a validar os dados do Lattes.

Intruções de como usar o transformador estão no README do repositório,
mas como o texto lá está em inglês, segue a idéia geral. O que fiz foi
uma transformação XSLT do XML/Lattes para o XML/MODS. Este último pode
ser então facilmente convertido para BibTex usando o xml2bib, programa
do pacote [Bibutils](http://sourceforge.net/p/bibutils/) disponivel no
Linux e no MacOS (MacPorts). Para executar a transformação e validar
um XML em relação ao seu DTD/Schema, ainda são necessários os
programas xsltproc e xmllint.

## Instalação dos programas necessários

Para quem usa o MacPorts no MacOS:

    sudo port -v install bibtool bibutils

O xmllint e xsltproc já estão instalados no MacOS (acho que no XCode).

Para quem usa Linux/Ubuntu:

    sudo apt-get install bibtool bibutils xsltproc libxml2-utils

Para quem usa Windows, consultar o site destas ferramentas, não
trivial! Esquece o Windows e instala o Ubuntu! ;-)

## Usando a transformação

Com as ferramentas instaladas, o primeiro passo é acesssar o sistema
[Lattes do CNPq](http://lattes.cnpq.br), link **atualizar**, logar-se
no sistema e escolher a opção de exportar para XML. Será iniciado o
download de um arquivo ZIP. Abra ZIP e extraia o arquivo XML dentro
dele que tem mesmo nome, seu lattes ID. Imagine então que vc renomeou
este arquivo XML para `LATTES.xml` e o moveu para o mesmo diretório
onde está o arquivo com `lattes2mods.xsl` que você pegou do
repositório no github.

Agora basta rodar:

    xsltproc lattes2mods.xsl LATTES.xml > LATTES.mods
    
E em seguida:

    xml2bib -b -w LATTES.mods > LATTES.bib

Mas o interessante é antes de rodar o xml2bib, validar o arquivo mods
gerado contra o
[XML Schema do MODS](http://www.loc.gov/standards/mods/mods-schemas.html),
disponibilizado no site da Biblioteca do Congresso Americano, baixe a
versão 3.4:

    xmllint --schema mods.xsd LATTTES.mods

Esta validação serve para verificar não apenas erros na estrutura do
arquivo, que seriam bugs no meu código, mas também erros nos dados, em
função de informações erradas (faltantes, em lugar errado etc) no
Lattes.

Comentários são sempre bem vindos. Problemas podem ser reportados
diretamente no [github](https://github.com/arademaker/SLattes/issues).

