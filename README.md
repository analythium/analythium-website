# analythium-website

> Analythium website.

## Local development with Docker

Build the local development image:

```bash
docker build -t analythium-website .
```

Run the Jekyll development server with the repository mounted into the container:

```bash
docker run --rm -it \
  --name analythium-website-dev \
  -p 4000:4000 \
  -p 35729:35729 \
  -v "$PWD":/srv/jekyll \
  analythium-website
```

Then open <http://localhost:4000>.

The container starts `jekyll serve` with live reload enabled, so saved changes in the working tree are rendered automatically and the browser refreshes when the site updates.

Press `Ctrl+C` in the terminal running the server to stop it. To check for a running preview or stop it from another terminal, use:

```bash
docker ps --filter 'name=analythium-website-dev'
docker stop analythium-website-dev
```

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

## TODO

- revise logos
- revise services page
- add project pages for all projects
- revise data-science page and add project list where services = data-science
- revise engineering page and add project list where services = engineering
- revise training page and add project list where services = training
- migrate apps to Connect and update URLs
- trim down the apps list
- blog posts for papers: wildlift, sqpad, rockerverse
- blog post for courses: data cloning Budapest, SSC workshop

Structure for post:

- Header (from yml header):
  - Project title
  - Project subtitle
  - Project date
  - link to the app if there is one
  - thumbnail image
  - Client color logo (look up URL etc from _data/clients.yml)
  - Client (look up URL etc from _data/clients.yml)
  - Sector (look up from _data/clients.yml)
  - list the project services

- Sections:
  - Motivation
  - The project
  - Our results


Projects:

- DONE Alamar: use SOW
- DONE WBI: use url https://wbi.predictiveecology.org/
- DONE Caribou
- DONE 3D plot builder

- Air quality exploration & air quality index
- Yukon, moosecounter: https://github.com/psolymos/moosecounter
- BC Gov: shiny app, db
- Stanford: scaling etc.
- MTI/FMMN???


LATE WINTER MOOSE DISTRIBUTION SURVEY METHODS
Description of Duties/Deliverables:
A) Data analysis of the late-winter Rau Road survey data (the 2019 early-winter census data analysis is complete) and a
detailed description of the methodology used. This would involve 1) generating predictive spatial models for moose in
late-winter during winters of high and low snow years and 2) the methodology required to quantify the potential impact
of the proposed road.
B) Evaluation of the survey protocol used by YG to determine if it is appropriate to detect whether the proposed road
might have an impact on moose distribution and abundance within the 10 km buffer (eg how many blocks/moose
locations are required to provide reasonable estimates - this will require some type of sensitivity analysis and
simulations of existing data). This assessment is essential for Yukon Environment to recommend this approach for future
projects.
C) A "Manual" that would have all the information required for proponents to conduct the work. This would include the
survey design, fieldwork, data collection, and details of the analysis.
D) Creation of software that would facilitate data collection and analysis for proponents and consulting companies (this
deliverable is listed as a separate budget item because it can be a separate project for next fiscal).

