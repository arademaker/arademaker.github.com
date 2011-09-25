---
layout: default
title: Verifying check digit of ISSN
category: lisp
---

The code below is my first approach to create a lisp function that
test the ISSN [check
digit](http://en.wikipedia.org/wiki/Check_digit). Unfortunately, the
code runs only in Allegro CL due the requirement of regexp2
library. Since the regexp2 library is easly replaced by an opensource
regexp library, this is not a real constraint.

<script src="https://gist.github.com/1215526.js"> </script>

That is it! Comments are welcome!

