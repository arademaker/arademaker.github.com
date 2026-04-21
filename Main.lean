import VersoBlog
import Site.Theme
import Site.FrontPage
import Site.About
import Site.Publications
import Site.Teaching

import Site.Categories
import Site.Blog
import Site.Blog.Placeholder

open Verso Genre Blog Site Syntax

def mySite : Site := site Site.FrontPage /
  static "static" ← "static_files"
  static "files" ← "files"
  "about" Site.About
  "publications" Site.Publications
  "teaching" Site.Teaching
  "blog" Site.Blog with
    Site.Blog.Placeholder

def main := blogMain Site.theme mySite
