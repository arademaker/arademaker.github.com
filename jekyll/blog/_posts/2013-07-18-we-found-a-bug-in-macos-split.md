---
layout: post
title: We found a bug in the split command of Mac OS
tags: 
 - research
---

Yesterday my friend
[Marcelo Nery](http://researcher.ibm.com/researcher/view.php?person=br-mnerys)
and I found a bug in the `split` command of Mac OS. At first, I was
surprised (we don't expect to find bugs in core tools like grep, ls,
split, wc..., right?) and almost expected to find the same bug in the
Linux version of split. At least in the split of Ubuntu distribution,
that was not the case. The bug is presented only in the Mac OS
version.

## The bug

Consider the file `zero.log` created with the following Common Lisp code
(actually for the rest of the post you don't need to understand the
code):

{% highlight common-lisp %}
(with-open-file (out "zero.log" :element-type '(unsigned-byte 8)
			      :direction :output
			      :if-exists :supersede
			      :external-format :utf-8)
	   (loop for char across (format nil "AB_CDE~%F~%G~%")
		     do (if (equal char #\_)
			      (loop for i from 1 to 3 do
                     (write-byte 0 out))
			      (write-byte (char-code char) out))))
{% endhighlight %}

This file content could be inspected with hexdump command: 

{% highlight bash %}
$ hexdump -C zero.log
00000000  41 42 00 00 00 43 44 45  0a 46 0a 47 0a     |AB...CDE.F.G.|
0000000d
{% endhighlight %}

That is, the file has three 0 bytes in the first line right after the
`B` letter and before the `C` letter. Now we want to split this file
one line per file.

The Linux version of split works as expected, it splits the file
keeping the zero bytes unchanged.

{% highlight bash %}
$ split -1 zero.log
$ for f in x??; do echo "---Begin: $f"; cat $f; echo "---End: $f"; done
---Begin: xaa
ABCDE
---End: xaa
---Begin: xab
F
---End: xab
---Begin: xac
G
---End: xac
{% endhighlight %}


Moreover, the sum of bytes of the `x??` files is equal the number of
bytes in the `zero.log` file, 13 bytes.

Nevertheless, the Mac OS version of split produces an unexpected
output. The letter `F` is merged with the begining of the first line
althouth it is in the second line of the `zero.log` file. Besides
that, the zero bytes causes the Mac OS split to ignore the rest of the
first line of `zero.log` causing a lost of data. The sum of the bytes
of the `x??` files in Mac OS is only 6 bytes.

{% highlight bash %}
$ split -1 zero.log
$ for f in x??; do echo "---Begin: $f"; cat $f; echo "---End: $f"; done
---Begin: xaa
ABF
---End: xaa
---Begin: xab
G
---End: xab
{% endhighlight %}

## Reporting the bug

I reported the bug to Apple using the
[Mac OS Feedback form](http://www.apple.com/feedback/macosx.html).


