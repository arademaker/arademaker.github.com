---
layout: post
title: R Package SSOAP
tags: 
 - R
 - package
 - blog
---

{{ page.title }}
================

Last year, during a summer course that I gave at FGV, I taught the
students how to use SOAP protocol do retrive data from
[Banco Central do Brasil](http://bcb.gov.br/) using R. BCB has a
system called SGS (Sistema Gerenciador de Séries Temporais) that has a
SOAP interface.

At that time, the [package SSOAP](http://www.omegahat.org/SSOAP/) had
a small bug that I contributed to fix. Today I found that my
contribution was incorporated in
[version 0.5-5](http://www.omegahat.org/SSOAP/Changes.html) of this
package whish makes my
[repository at github](https://github.com/arademaker/SSOAP) outdated.

It took my a couple of minutes to test the new version of this
package. Since I am running the last version of R, 2.14, the general
procedure for install packages didn't work.

    > install.packages("SSOAP")
    Warning message:
    In getDependencies(pkgs, dependencies, available, lib) :
      package ‘SSOAP’ is not available (for R version 2.14.0)

I finnaly figured out how to install the last version from source
using the Omegahat repository version with the command:

    > install.packages("SSOAP", repos = "http://www.omegahat.org/R", 
                       dependencies = TRUE, 
                       type = "source")
    trying URL 'http://www.omegahat.org/R/src/contrib/SSOAP_0.8-1.tar.gz'
    Content type 'application/x-gzip' length 195424 bytes (190 Kb)
    opened URL
    ==================================================
    downloaded 190 Kb
    
    * installing *source* package ‘SSOAP’ ...
    ** R
    ** inst
    ** preparing package for lazy loading
    Creating a new generic function for ‘help’ in package ‘SSOAP’
    Warning in .NonstandardGenericTest(body(fdef), name, stdGenericBody) :
      the supplied generic function definition for toSOAP does not
      seem to call 'standardGeneric'; no methods will be dispatched!
    ** help
    *** installing help indices
    ** building package indices ...
    ** testing if installed package can be loaded
    
    * DONE (SSOAP)
    
    The downloaded packages are in
    	‘/private/var/.../downloaded_packages’

After that, I was prepared to actually test the package running the
code that I created during the
[course](https://github.com/arademaker/IR-2011/) (lesson 7 directory
aula-07). But some changes in RCurl package requires a change in how
we ask for not verify the ssl certificate. That is, I had to replace
the `ssl.verifypeer = FALSE` argument by a list of options in the call
of the function `ff@functions$getValoresSeriesXML`. The last version
of this script is now available as a gist here:

<script src="https://gist.github.com/1550651.js"> </script>

Note that the `ssl.verifypeer` argument is necessary because the
certificate used in BCB website is invalid! What a shame!

![BCB certificate](/images/2012-01-02-bcb-certificate.png)

