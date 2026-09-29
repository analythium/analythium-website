# analythium-website

Analythium website.

## Local development with Docker

Build the local development image:

```bash
docker build -t analythium-website .
```

Run the Jekyll development server with the repository mounted into the container:

```bash
docker run --rm -it \
  -p 4000:4000 \
  -p 35729:35729 \
  -v "$PWD":/srv/jekyll \
  analythium-website
```

Then open <http://localhost:4000>.

The container starts `jekyll serve` with live reload enabled, so saved changes in the working tree are rendered automatically and the browser refreshes when the site updates.

If you change Ruby dependencies, rebuild the image:

```bash
docker build -t analythium-website .
```

To render a production build without starting the dev server:

```bash
docker run --rm -it \
  -v "$PWD":/srv/jekyll \
  analythium-website \
  bundle exec jekyll build
```
