# arademaker.github.com

Personal homepage of [Alexandre Rademaker](https://arademaker.github.io), built with [Verso](https://verso.lean-lang.org) — written in Lean, checked by Lean.

## Structure

```
Main.lean                  # Entry point and site structure declaration
Site.lean                  # Library root (imports all page modules)
Site/
  Theme.lean               # HTML template and navigation
  theme.css                # Stylesheet (embedded at build time)
  FrontPage.lean           # Home page
  About.lean               # About page
  Publications.lean        # Publications (links to Google Scholar, DBLP, ORCID)
  Teaching.lean            # Teaching history
  Blog.lean                # Blog section
  Blog/
    Placeholder.lean       # Example post (template for new posts)
  Categories.lean          # Blog post categories
static_files/
  images/                  # Photos and images
files/                     # PDFs (papers, slides)
_bibliography/             # BibTeX source (rademaker.bib)
scripts/
  check_links.sh           # Checks that hyperlinks in Site/ resolve
```

## Building

Install [elan](https://github.com/leanprover/elan) (the Lean version manager), then:

```bash
lake update     # download dependencies (first time only)
lake build      # compile the site
```

## Running locally

After building, generate the static site and serve it:

```bash
.lake/build/bin/generate-site
cd _site && python3 -m http.server 8080
```

Then open http://localhost:8080.

## Adding a blog post

1. Copy `Site/Blog/Placeholder.lean` to `Site/Blog/MyPostTitle.lean`
2. Update the metadata (`authors`, `date`, `categories`) and write the content
3. Add `import Site.Blog.MyPostTitle` to both `Site.lean` and `Main.lean`
4. Add `Site.Blog.MyPostTitle` to the `"blog" Site.Blog with` block in `Main.lean`
5. Run `lake build` to verify it compiles

## Checking links

To verify that every hyperlink referenced in `Site/**/*.lean` still resolves:

```bash
scripts/check_links.sh
```

It exits non-zero and lists any URL that returned an HTTP error or failed to
connect. Some sites (e.g. ResearchGate, LinkedIn) block automated requests
and may show up as false positives — check manually in a browser before
assuming a flagged link is actually dead.

## Deployment

Pushing to `main` triggers the GitHub Actions workflow at `.github/workflows/deploy.yml`, which builds the site and deploys it to GitHub Pages.

The `source` branch preserves the previous Jekyll version of the site.
