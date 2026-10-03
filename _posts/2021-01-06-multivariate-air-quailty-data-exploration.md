---
layout: post
title: Multivariate Air Quality Data Exploration
date: '2021-01-06 05:58:39 +0000'
author: Analythium Data Science Team
thumbnail: /assets/images/blog/multivariate-air-quailty-data-exploration-1-c570418a.jpg
thumbnail_alt: Multivariate Air Quality Data Exploration
tags:
- Environment
source: https://blog.analythium.io/multivariate-air-quailty-data-exploration/
---
![Multivariate Air Quality Data Exploration]({{ '/assets/images/blog/multivariate-air-quailty-data-exploration-1-c570418a.jpg' | relative_url }})

Data most often comes in a **tabular format** where multiple columns contain variables (measurements) related to one another. For example, we can measure various chemical substances in air at a given sampling location (sample site) at a specific point in time. This sample and the corresponding measurements will then make up a row in our tabular data set. We can also measure air temperature, wind speed, etc. All these variables together are called **multivariate data**. This post describes some of the fundamental steps in 'exploratory data analysis' ([EDA](https://r4ds.had.co.nz/exploratory-data-analysis.html?ref=blog.analythium.io)) using air quality data as an example.

We have introduced the Alberta Air Quality dataset in a previous post. There we explored spatial and temporal changes in the concentration of sulphur dioxide (SO2). We will use the same data set in this post, but this time using multiple variables.

The data set originated from the [Alberta Air Data Warehouse](https://www.alberta.ca/alberta-air-data-warehouse.aspx?ref=blog.analythium.io). We included data from 19 sampling stations operated by the Wood Buffalo Environmental Association ([WBEA](https://wbea.org/?ref=blog.analythium.io)). The number of variables varied between 10 and 19. Some stations have been operated since 1998, other since 2017. Our data set contained daily aggregates of the hourly measurements up till the end of 2019.

# Variation in the data

Each variable can be characterized on its own. For example, we can look at the mean of SO2 from all the stations and years in determining that the **mean** was 39.9 ppb (daily maximum aggregate values). We can also determine that the values ranged between 0 (non-detect) and 113.1 ppb, this range is a particular measure of **variation**. Looking at variables in isolation and in combination (additive effect monitoring) is important for both environmental protection and human health. When looking at discrete variable concentrations one can compare a specific measurements against [ambient air quality objectives](https://www.alberta.ca/ambient-air-quality-objectives.aspx?ref=blog.analythium.io) (AAQO). Similarly, when looking at multiple variables one can compare the overall effects against the [air quality health index](https://www.alberta.ca/about-the-air-quality-health-index.aspx?ref=blog.analythium.io) (AQHI).

# Covariation

When looking at two variables at a time we can assess their **covariation**. If the two variables tend to vary together, we say that they are correlated. For example, in our data set, ozone (O3) showed a negative correlation with relative air humidity (RH). The correlation is negative because when one variable increases, the other decreases. This tendency is visualized by the blue trend line in the following graph.

![Multivariate Air Quality Data Exploration]({{ '/assets/images/blog/multivariate-air-quailty-data-exploration-2-8ad58ac1.png' | relative_url }})

*Negative correlation between ozone and relative humidity.*

Such correlation is not sufficient for determining causation. Proving causation often requires mechanistic modelling and experimentation. But studying correlation can be an important step in the process of data exploration because exploratory data analysis can be used to **generate hypotheses** regarding causation.

# Heatmap

When we have more than 10 variables, a really useful way of determining the relationships between the variables is via a **heatmap**. A heatmap is a table like graph where rows and columns represent variables. The cells of this table-like graph represent the correlation based on the bivariate scatterplots, like the one above. For each pair of variables, we can calculate the correlation. If the correlation is negative, we colour the cell blue (see for O3 and RH). If the correlation is positive (when one increases, the other one increases too), we colour it red. The diagonal (red cells across) indicates perfect correlation when the row and the column is the same variable.

![Multivariate Air Quality Data Exploration]({{ '/assets/images/blog/multivariate-air-quailty-data-exploration-3-676ff56a.png' | relative_url }})

*Heatmap conveying relationships among multiple variables: each cell can be expanded into a scatterplot.*

# Interactive exploration

The interactive application below was built to explore the covariation among the variables. Follow the instructions at the top of the app and the Previous/Next buttons to see examples and explore the data. Variables can be logarithmically transformed to better reveal the differences among the lower values. Trend lines can be drawn based on the overall relationship, or year by year. Trend lines for the different years are coloured different shades of blue to help identify trends over time.

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

# Get in touch

If you have similar data set and you would like expert advice on processing, transforming, analyzing your data or developing data integration pipelines or dashboards, [schedule a free](https://calendly.com/analythium/demo?ref=blog.analythium.io) **[consultation](https://calendly.com/analythium/demo?ref=blog.analythium.io)** to discuss your needs and how we can help. Sign up for our **newsletter** below to be in the know!
