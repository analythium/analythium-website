---
layout: post
title: Data Science Serverless-style
date: '2021-05-17 12:00:00 +0000'
author: Peter Solymos
thumbnail: /assets/images/blog/data-science-serverless-style-1-36828205.jpg
thumbnail_alt: Data Science Serverless-style
tags:
- Hosting
source: https://blog.analythium.io/data-science-serverless-style/
---
![Data Science Serverless-style]({{ '/assets/images/blog/data-science-serverless-style-1-36828205.jpg' | relative_url }})

When you want to scale data science capabilities within your organization there are plenty of options to choose from. However, if you want the **bleeding edge** of technology and also want to **avoid vendor lock-in** when it comes to your choice of cloud provider, your options are limited. In this post, we outline how Analythium is leading the way to **combine the power of R with Serverless for data science**.

## What is R and why use it

[R](https://www.r-project.org/?ref=blog.analythium.io) is well suited for data science due to its diverse tooling and its ability to leverage and integrate with other languages and solutions. R is one of the most popular languages for **data science**, **statistical computing** and **visualization**.

R is used in disciplines relying on classical statistical approaches, such as academia, healthcare/biostatistics, environmental sciences, and finance (regulated markets). The **latest statistical methods** are immediately accessible because these are published as extension packages alongside journal articles.

Besides the interactive data wrangling use cases, R is also a capable scripting language from the command line, and has powerful **web server frameworks** for building interactive applications or publishing APIs with minimal effort.

## What is Serverless

There are different levels of the infrastructure and application stack managed by organizations vs. cloud vendors:

- On-prem: you own all the hardware and pay all the utilities
- IaaS: infrastructure as a service, you install everything
- PaaS: platform as a service, virtual machines, app platforms
- FaaS: function as a service, also called **serverless**
- SaaS: software as a service

From private (left) to public cloud (right), the blue colour indicates part of the stack that is managed by a cloud vendor:

![Data Science Serverless-style]({{ '/assets/images/blog/data-science-serverless-style-2-15bdfa28.png' | relative_url }})

*From private to public cloud / **©** Analythium*

> [Cloudflare](https://www.cloudflare.com/pt-br/learning/serverless/what-is-serverless/?ref=blog.analythium.io)

## What is OpenFaaS

When it comes to serverless, every cloud provides has their own opinions and constraints and approaches are hard to migrate between clouds. The [OpenFaaS project](https://www.openfaas.com/?ref=blog.analythium.io) was born to mitigate this problem of vendor lock-in. You can host both microservices and functions in any language, use legacy code and binaries. OpenFaaS is an open-source framework to deploy **anywhere**, including your local cluster, public cloud, even to IoT edge devices, and at any scale, with an emphasis on [Kubernetes](https://kubernetes.io/?ref=blog.analythium.io).

## Combining R and OpenFaaS

In production, R is often just a piece of a much larger puzzle providing API endpoints via these web frameworks. Managing many API endpoints can lead to problems due to shifting **dependency requirements** or more recent additions breaking older code. The common solution is to use containers to provide isolation to these components.

However, managing containers at scale is not trivial, and managing serverless infrastructure is often outsourced to public cloud providers. Providers differ in their approaches, leading to independent integrations of R and repeated efforts.

In our guest post on the **OpenFaaS blog** we introduce **R templates** for OpenFaaS and show you how to easily combine the power of R with Serverless for data science:

![Data Science Serverless-style]({{ '/assets/images/blog/data-science-serverless-style-3-afeeaa97.png' | relative_url }})

Check out the [templates](https://github.com/analythium/openfaas-rstats-templates?ref=blog.analythium.io) and [examples](https://github.com/analythium/openfaas-rstats-examples?ref=blog.analythium.io).

If you are interested in cloud hosting for data applications, you might also be interested in our newly launched publication:

![Data Science Serverless-style]({{ '/assets/images/blog/data-science-serverless-style-4-ff7c0711.png' | relative_url }})
