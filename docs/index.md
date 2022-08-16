---
knitr: bookdown::render_book
title: "R Code for Causal Inference: What If"
author: "Bill Behrman"
description: "R Code for Causal Inference: What If."
url: 'https\://behrman.github.io/ci-wi/'
github-repo: behrman/ci-wi
site: bookdown::bookdown_site
documentclass: book
bibliography: references.bib
link-citations: true
nocite: "@*"
---

# Welcome {-}

This book provides R code for Hernán and Robins, [Causal Inference: What If](https://www.hsph.harvard.edu/miguel-hernan/causal-inference-book/). The linked site has a PDF of the book.

You can run the code from this book on your computer by ensuring that you have the required R packages and by downloading the dataset used in chapters 12-17, as explained below. You can easily copy a block of code into your clipboard by hovering over it and then clicking the copy button that appears in the upper-right corner.

## How to install required R packages {-}

The following will install the R packages used in this book.


```r
install.packages(
  c(
    "tidyverse", "boot", "fs", "geepack", "here", "ivreg", "kableExtra",
    "knitr", "multcomp", "remotes", "scales", "survival"
  )
)
```

## How to download dataset {-}

To download the dataset used in chapters 12-17, first set your working directory to where you plan to run code. You can see your current working directory with `getwd()`, and you can set your working directory with `setwd()`. If you plan to run code within an RStudio project, set the directory to the root directory of the project. Next, run the following. It will create a subdirectory named data, if one doesn't already exist, and then download the dataset into it.


```r
url_nhefs <- 
  "https://raw.githubusercontent.com/behrman/ci-wi/master/data/nhefs.rds"

fs::dir_create("data")
download.file(url = url_nhefs, destfile = "data/nhefs.rds")
```

## Source for this book {-}

The [source for this book](https://github.com/behrman/ci-wi) is available on GitHub where we welcome suggestions for improvements.

This work is licensed under a [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-nc-sa/4.0/). 
