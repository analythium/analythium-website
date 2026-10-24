# Project Guidelines

## Project structure

- This is a static website built with Jekyll 4.4, Liquid, Markdown, and custom CSS.
- Shared page structure lives in `_layouts/`; reusable fragments live in `_includes/`; global content and settings live in `_data/` and `_config.yml`.
- Project and app entries are Markdown files in `_projects/` and `_apps/`. Follow the existing front matter and layouts when adding entries.
- Edit source files, not generated output in `_site/`.

## Conventions

- Use Liquid's `relative_url` filter for internal links and local asset paths so the site works with a GitHub Pages `baseurl`.
- Reuse the existing Bootstrap 5 classes, CSS variables, layouts, and includes before introducing new patterns or dependencies.
- Preserve accessible semantics: meaningful image alternatives, form labels, keyboard-operable controls, visible focus, and appropriate ARIA for dynamic updates.
- Check color contrast in both dark and light themes when changing UI colors or components.
- Follow W3C accessibility guidelines, targeting WCAG 2.2 AA for semantics, keyboard access, focus, contrast, and dynamic content.
- Keep page titles, descriptions, thumbnails, and other relevant front matter accurate when adding or revising pages.

## Build and preview

- The project uses Docker for local development. Build the image with `docker build -t analythium-website .`.
- Start the preview with `docker run --rm -it --name analythium-website-dev -p 4000:4000 -p 35729:35729 -v "$PWD":/srv/jekyll analythium-website`, then visit `http://localhost:4000`.
- Run a production build with `docker run --rm -v "$PWD":/srv/jekyll analythium-website bundle exec jekyll build`.
- Validate edits with a Jekyll build and `git diff --check` when practical.
