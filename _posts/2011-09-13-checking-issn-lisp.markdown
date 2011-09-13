---
layout: default
title: Verifying check digit of ISSN
---

The code below is my first approach to create a lisp function that
test the ISSN [check
digit](http://en.wikipedia.org/wiki/Check_digit). Unfortunately, the
code runs only in Allegro CL due the requirement of regexp2
library. Since the regexp2 library is easly replaced by an opensource
regexp library, this is not a real constraint.

{% highlight cl linenos %}
(require :regexp2)

(defpackage :utils 
  (:use :common-lisp :vas-string-metrics))

(in-package :utils)

(defun check-issn (s)
  (let* ((sclean (regexp:replace-re (string-upcase s) "[^0-9X]" ""))
	 (digits (loop for char across sclean
		       collect (if (equal (string char) "X") 10 (parse-integer (string char)))))
	 (pos10 (position 10 digits)))
    (if (or (not (equal (length digits) 8)) (and (not (null pos10)) (< pos10 7)))
	nil
	(let ((dv (- 11 (mod (apply #'+ 
				    (loop for i from 8 downto 2 
					  for j in digits 
					  collect (* j i))) 11))))
	  (equal dv (nth 7 digits))))))
{% endhighlight %}

That is it! Comments are welcome!

