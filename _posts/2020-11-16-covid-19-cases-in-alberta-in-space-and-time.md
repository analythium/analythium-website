---
layout: post
backlink: /blog/
title: COVID-19 Cases in Alberta in Space and Time
date: '2020-11-16 08:52:31 +0000'
author: Analythium Data Science Team
thumbnail: /assets/images/blog/covid-19-cases-in-alberta-in-space-and-time-1-36ed86a3.jpg
thumbnail_alt: COVID-19 Cases in Alberta in Space and Time
tags:
- Health
source: https://blog.analythium.io/covid-19-cases-in-alberta-in-space-and-time/
---
![COVID-19 Cases in Alberta in Space and Time]({{ '/assets/images/blog/covid-19-cases-in-alberta-in-space-and-time-1-36ed86a3.jpg' | relative_url }})

**COVID-19** remains the greatest health risk and economic driver of our lives. Since our last blog post on the [**CAIMS blog**](https://caims.ca/caims-blog/decision-making-under-extreme-uncertainty-in-the-covid-19-pandemic/?ref=blog.analythium.io), a lot has changed as we are in the middle of the second wave. As the numbers of COVID-19 cases is climbing worldwide, we thought it is timely to dive into the detailed data set we have in Alberta, thanks to the portal provided by [**Alberta Health**](https://covid19stats.alberta.ca/?ref=blog.analythium.io).

We started where we left off. In May we produced a web application that pulls together various data sources as part of daily automated data updates. The app condensed lots of information about COVID-19 **worldwide, in Canada, and in Alberta**. Check out the app and the introductory video at the end of the post:

![COVID-19 Cases in Alberta in Space and Time]({{ '/assets/images/blog/covid-19-cases-in-alberta-in-space-and-time-2-aaf42be5.png' | relative_url }})

Driven by our own interest in looking at case counts close to our homes, we decided to drill down into the Alberta data utilizing the **space-time information** we have available for **132 local areas** in the province. Alberta Health updates data regularly for case numbers, including active cases, recovered cases, and deaths. Because data were not always updated on weekends, we aggregated the data in weekly intervals.

Besides the **cumulative case numbers**, we also looked at **incidences**. Incidence is the case number standardized by the population size in the area, i.e. number of cases / 1000 individuals. We used the 2017 census data for this. We calculated the number of **"new" cases** that is the increase in the case numbers since the previous weekly interval.

Using this information, we updated the interactive **map** that we had in the previous web app. The map is interlinked with the **time series** graph next to it which highlights the series if the spatial area selected in the map. The date can be picked on the slider that also allows **autoplay** by clicking the play button on the right-hand side of the slider.

The animation below illustrates the increase of the total number of COVID-19 cases in the **Edmonton** and **Calgary** health zones, the two highest population centres in the province, over the past nine months. The time series graph on the right shows the trajectory for the geographic areas within the two health zones:

![COVID-19 Cases in Alberta in Space and Time]({{ '/assets/images/blog/covid-19-cases-in-alberta-in-space-and-time-3-3f57576f.gif' | relative_url }})

*Total number of COVID-19 cases in Edmonton and Calgary between March and November, 2020*

Use the various controls in the app to:

- Select cumulative or new cases
- Show cases or incidences
- Look at the whole province or select individual health zones
- Display totals, or acive, recovered cases, or deaths
- Select the date for which the map should show the cases
- Use the autoplay option of the slider
- Hover and click the areas in the map to see the values in the popup
- Inspect interlinked time series plots on the right
- Hover ove the lines in the time series plot to see areas and case numbers

------------------------------------------------------------------------

<div class="iframe">

<div>

</div>

<div id="content">

<div class="container vertical-table">

<div class="row vertical-align-middle">

<div class="col-lg-12">

<div class="spinner text-center">

### Please Wait

![loading](/__static__/frontend/images/spinner.gif?v=ce6bcde20b2f6c562913c06be83f9e7c8a19b008017407a3094b76fa82bbd6b7f4048e032e07e534d4ab5442b9105294d612863735077ab13a47653a14c5866e)

</div>

</div>

</div>

</div>

</div>

</div>

------------------------------------------------------------------------

If you liked this interactive visualization, sign up for our **newsletter** below to get notifications about future updates. If you have complex data that you want to leverage, we can help! [Schedule a free](https://calendly.com/analythium/demo?ref=blog.analythium.io) **[consultation](https://calendly.com/analythium/demo?ref=blog.analythium.io)** to discuss how we can help. Visit our **website** to learn more our data science, and machine learning solutions.

![COVID-19 Cases in Alberta in Space and Time](https://analythium.io/favicon.ico)
