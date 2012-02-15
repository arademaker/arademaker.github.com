---
layout: publication
title: A Rewriting Semantics for a Software Architecture Description Language 
author:
 - Alexandre Rademaker
 - Alexandre Sztajnberg
 - Christiano de Oliveira Braga
venue: Simpósio Brasileiro de Métodos Formais (SBMF), 2005
tags: publication
link:
 - http://www.sciencedirect.com/science/article/pii/S157106610500229X
---

{{ page.title }}
================

Distributed and concurrent application invariably have coordination
requirements. The design of those applications, composed by several
(possibly distributed) components, has to consider coordination
requirements comprising inter-component interaction styles, and
intra-component concurrency and synchronization aspects. In our
approach coordination aspects are treated in the software architecture
level and can be specified in high-level contracts in CBabel ADL. A
rewriting logic semantics for the software architecture description
language CBabel is given, revisiting and extending previous work by
some of the authors, which now includes a revision of the previous
semantics and the addition of new features covering all the
language. The CBabel tool is also presented. The CBabel tool is a
prototype executable environment for CBabel, that implements the given
CBabel's rewriting logic semantics and allows the execution and
verification of CBabel descriptions in the Maude system, an
implementation of rewriting logic. In this way, software architectures
describing complex applications can be formally verified regarding
properties such as deadlock and synchronization consistency in the
software architecture design phase of its life cycle.

Keywords: software architecture description languages; rewriting
logic; Maude; contracts
