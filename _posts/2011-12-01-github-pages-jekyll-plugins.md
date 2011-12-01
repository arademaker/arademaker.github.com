---
layout: post
title: GitHub Pages and Jekyll plugins
tags: 
 - jekyll
 - git
 - blog
---

{{ page.title }}
================

Everyone that use [Jekyll](http://jekyllrb.com/) and wants to host the site at GitHub should know that GitHub Pages does not allow custom plugins, right? Using Jekyll for a little more than a blog site, like [EMAp/FGV](http://emap.fgv.br) will require plugins. In my case, avoid the use of custom plugins is not an option.

The solution is trivial, one has to run Jekyll locally and post the produzed files into a master branch of a git repo, following the conventions described at [GitHub Pages](http://pages.github.com/) por person and organization pages. The problem that I faced was to choose the best way to organize and keep tracking of the source and produzed files.

I read a couple of posts with possible solutions. The solution by [Charlie Park](http://charliepark.org/jekyll-with-plugins/) force us to have two distinct git repositories. I don't like this approach because of that. Our website will be maintained by more than one person, having two distinct repositories since that I will not using all git features. The solution by [Jean Denis](http://tech.hugr.fr/blog/2011/08/07/how-to-host-a-jekyll-app-on-github-pages-with-plugins/) is a little bit better but keeps me thinking about why he need to keep the produced files under version control in the two branches, gh-pages and the master. 

My final solution is to keep the directory produced by jekyll out of git control. This simple thing allows me to switch the branches, from source to master, and still have access to the produced files, directory `_site`. Once in the master branch, I only have to move the files under `_site/` to the root directory in the master branch and update the master branch before push it to GitHub.

    git checkout source
    // do whatever you need
    git status / git add / git commit
    jekyll
    checkout master
    cp -r _site/* . && rm -rf _site/ && touch .nojekyll
    git status > git add > git commit
    git push -all origin

