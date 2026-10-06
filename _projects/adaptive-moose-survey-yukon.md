---
layout: project
backlink: /projects/
featured: no
title: Adaptive Moose Survey Design and Analysis
subtitle: Using daily survey data to guide more informative surveys in the Yukon.
summary: An adaptive sampling workflow and interactive R software supported spatial estimates of moose abundance and composition while targeting survey effort where predictions were most uncertain.
thumbnail: /assets/images/projects/moosecounter-multivariate-exploration.png
thumbnail_alt: MooseCounter user interface with predictive map
client: yukon-gov
services:
  - Data science
  - Engineering
---

## Motivation

Moose are an important traditional food source for Indigenous communities in Yukon, and licensed harvest is managed using annual quotas to support sustainable populations. Setting those quotas requires reliable estimates of where moose occur, how abundant they are, and whether population recruitment and harvest remain sustainable.

The surveys covered large remote areas by helicopter, making fieldwork expensive. The commonly used stratified random approach could also misclassify survey units, miss patchy distributions, and provide limited information about uncertainty at individual locations.

## The project

Analythium in collaboration with Yukon biologists developed an interactive software package called [MooseCounter](https://github.com/psolymos/moosecounter) to support model fitting and prediction for total abundance and population composition, alongside data filtering, exploration, diagnostics, and survey planning. This enabled researchers and field biologists to review results and adapt sampling as data arrived.

An adaptive sequential sampling strategy combined expert knowledge, environmental covariates, and results from earlier surveys to guide field effort. Initial survey units were selected across high- and low-density strata. After each day of observations, the tool was used to estimate moose abundance and prediction uncertainty for unsurveyed units. The next day’s helicopter routes could then prioritize units with the greatest prediction uncertainty, repeating the cycle until the desired level of precision was reached.

## Our results

The project delivered an adaptive, model-based workflow for allocating survey effort and a software tool to support its practical use. By updating estimates and uncertainty as observations accumulated, the approach was designed to reduce prediction error and make more efficient use of costly helicopter survey days than relying on a fixed random sample alone.
The resulting spatial estimates also provided information about moose distribution that could support harvest management and assessment of potential effects from human development.

- [MooseCounter R package and Shiny app](https://github.com/psolymos/moosecounter/)
