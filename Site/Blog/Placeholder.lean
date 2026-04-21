import VersoBlog
import Site.Categories
open Verso Genre Blog

#doc (Post) "Hello, Verso!" =>
%%%
authors := ["Alexandre Rademaker"]
date := {year := 2026, month := 4, day := 21}
categories := [Site.blog]
%%%

This is a placeholder post. When writing a new post, copy this file, rename it, and update the metadata above.

# Structure of a Post

Each post is a Lean file in `Site/Blog/`. The frontmatter block between `%%%` markers sets:

- `authors` — list of author names
- `date` — publication date `{year, month, day}`
- `categories` — post categories (defined in `Site/Categories.lean`)

The body uses standard Verso markup: _italic_, *bold*, `code`, links, lists, headings.

After creating the file, add it to both `Site.lean` and `Main.lean`.
