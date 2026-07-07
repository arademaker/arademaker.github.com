import VersoBlog
open Verso Genre Blog

def siteCSS : String := include_str "theme.css"

namespace Site

open Output Html Template Theme in
def theme : Theme := { Theme.default with
  primaryTemplate := do
    let postList :=
      match (← param? "posts") with
      | none => Html.empty
      | some html => html
    return {{
      <html>
        <head>
          <meta charset="utf-8"/>
          <meta name="viewport" content="width=device-width, initial-scale=1"/>
          <title>{{← param (α := String) "title"}} " — Alexandre Rademaker"</title>
          <meta name="author" content="Alexandre Rademaker"/>
          <meta name="description" content="Alexandre Rademaker — Researcher and Professor"/>
          <link href="https://fonts.googleapis.com/css?family=Inconsolata" rel="stylesheet" type="text/css"/>
          <style>{{siteCSS}}</style>
          {{← builtinHeader}}
        </head>
        <body>
          <div id="outer">
            <div id="top"></div>
            <div id="left">
              <img src="/static/images/arademaker.jpeg" alt="Alexandre Rademaker"/>
            </div>
            <div class="site">
              <div class="title">
                <a class="name" href="/">"Alexandre Rademaker"</a>
                <input type="checkbox" id="nav-toggle" class="nav-toggle"/>
                <label class="nav-burger" for="nav-toggle">
                  <span class="bar"></span>
                  <span class="bar"></span>
                  <span class="bar"></span>
                </label>
                <nav class="nav-links">
                  <a class="nav" href="/">"home"</a>
                  <a class="nav" href="/about/">"about"</a>
                  <a class="nav" href="/publications/">"publications"</a>
                  <a class="nav" href="/teaching/">"teaching"</a>
                  <a class="nav" href="/blog/">"blog"</a>
                </nav>
              </div>
              {{← param "content"}}
              {{postList}}
              <div class="footer">
                <div class="contact">
                  <p>
                    "Alexandre Rademaker" <br/>
                    "Adjunct Professor at " <a href="https://emap.fgv.br">"EMAp/FGV"</a> <br/>
                    "Director of " <a href="https://www.cslib.io">"CSLib"</a> <br/>
                    "arademaker AT gmail DOT com"
                  </p>
                </div>
                <div class="contact">
                  <p>
                    <a href="https://github.com/arademaker">"GitHub"</a> " | "
                    <a href="https://scholar.google.com/citations?user=SWz6BjIAAAAJ">"Google Scholar"</a> " | "
                    <a href="http://lattes.cnpq.br/0675365413696898">"Lattes"</a> " | "
                    <a href="https://twitter.com/arademaker">"Twitter/X"</a>
                  </p>
                </div>
              </div>
            </div>
            <div id="right"></div>
          </div>
        </body>
      </html>
    }}
  pageTemplate := do
    let path ← currentPath
    let title ← param (α := String) "title"
    let showTitle := !path.isEmpty
    return {{
      <article>
        {{ if showTitle then {{ <h1>{{title}}</h1> }} else Html.empty }}
        {{← param "content"}}
      </article>
    }}
  postTemplate := do
    return {{
      <article>
        <h1>{{← param "title"}}</h1>
        {{ match (← param? "metadata") with
           | none => Html.empty
           | some (md : Post.PartMetadata) => {{
              <div class="post-meta">
                {{md.date.toIso8601String}}
              </div>
           }}
        }}
        {{← param "content"}}
      </article>
    }}
  archiveEntryTemplate := do
    let post : BlogPost ← param "post"
    let target ← if let some p := (← param? "path") then
        pure <| p ++ "/" ++ (← post.postName')
      else post.postName'
    return #[{{
      <li>
        <span>{{post.contents.metadata.map (·.date.toIso8601String) |>.getD ""}}</span>
        " » "
        <a href={{target}}>{{post.contents.titleString}}</a>
      </li>
    }}]
  cssFiles := #[("site.css", siteCSS)]
}

end Site
