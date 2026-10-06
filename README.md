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
  Presentations.lean       # Talks and slides, grouped by year
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

## Lean and Verso versions

The site pins three things that must agree:

- `lean-toolchain` — the Lean toolchain (currently `leanprover/lean4:v4.34.0`)
- `lakefile.toml` — `verso` and `versowebcomponents`, both at the matching tag (`rev = "v4.34.0"`)
- `lake-manifest.json` — the exact commits resolved by `lake update`

Both Verso repositories publish a tag for every Lean release (`v4.34.0`,
`v4.35.0-rc1`, …), so always use the **same tag** for both and set
`lean-toolchain` to the corresponding Lean version. Never track `main`:
`lake update` copies the toolchain of the dependencies into
`lean-toolchain`, so a dependency on `main` can silently move the site to
a release candidate that Verso does not yet build against.

Prefer stable releases over release candidates. For example, the `lake`
binary shipped with `v4.34.0-rc1` crashes (exit code 133, SIGTRAP) on
recent macOS, even for `lake --version`, while stable releases work.

### Upgrading

1. Find a tag present in both
   [verso](https://github.com/leanprover/verso/tags) and
   [verso-web-components](https://github.com/leanprover/verso-web-components/tags):
   ```bash
   git ls-remote --tags https://github.com/leanprover/verso | grep v4.
   git ls-remote --tags https://github.com/leanprover/verso-web-components | grep v4.
   ```
2. Set both `rev` entries in `lakefile.toml` to that tag.
3. Run `lake update`, then check that `lean-toolchain` contains the
   matching `leanprover/lean4:<tag>` (fix it by hand if not).
4. Run `lake build` and `.lake/build/bin/generate-site`, and inspect the
   site locally before committing `lakefile.toml`, `lake-manifest.json`
   and `lean-toolchain` together.

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
