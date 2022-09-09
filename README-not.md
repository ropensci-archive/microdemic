microdemic
==========



[![cran checks](https://cranchecks.info/badges/worst/microdemic)](https://cranchecks.info/pkgs/microdemic)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![R-check](https://github.com/ropensci/microdemic/workflows/R-check/badge.svg)](https://github.com/ropensci/microdemic/actions?query=workflow%3AR-check)
[![codecov](https://codecov.io/gh/ropensci/microdemic/branch/master/graph/badge.svg)](https://codecov.io/gh/ropensci/microdemic)
[![rstudio mirror downloads](https://cranlogs.r-pkg.org/badges/microdemic)](https://github.com/r-hub/cranlogs.app)
[![cran version](https://www.r-pkg.org/badges/version/microdemic)](https://cran.r-project.org/package=microdemic)

`microdemic` - Microsoft Academic Client

Web interface: https://academic.microsoft.com/

API docs:
- https://docs.microsoft.com/en-us/azure/cognitive-services/academic-knowledge/
- https://msr-apis.portal.azure-api.net/docs/services/academic-search-api/operations/565d9001ca73072048922d97

Get a API key at https://msr-apis.portal.azure-api.net/signin

## install

cran version


```r
install.packages("microdemic")
```

dev version


```r
remotes::install_github("ropensci/microdemic")
```


```r
library("microdemic")
```

## Evaluate

See the [query expression syntax](https://docs.microsoft.com/en-us/azure/cognitive-services/academic-knowledge/queryexpressionsyntax)
for help on how to construct queries - for this and other functions


```r
ma_evaluate(query = "Y='19'...")
#> # A tibble: 10 x 8
#>    logprob     prob      Id Ti                         Y    CC AA      J.JN     
#>      <dbl>    <dbl>   <dbl> <chr>                  <int> <int> <list>  <chr>    
#>  1   -13.7  1.10e-6  2.12e9 image forming device    1992 32430 <df[,1… <NA>     
#>  2   -13.8  1.04e-6  1.86e9 standard methods for …  1992 81915 <df[,1… <NA>     
#>  3   -13.8  1.03e-6  2.16e9 the nature of statist…  1995 30098 <df[,1… <NA>     
#>  4   -13.9  9.18e-7  2.91e9 fuzzy sets              1996 44493 <df[,1… <NA>     
#>  5   -13.9  9.12e-7  2.16e9 gapped blast and psi …  1997 61351 <df[,1… nucleic …
#>  6   -13.9  8.77e-7  2.23e9 manufacture of semico…  1992 29044 <df[,1… <NA>     
#>  7   -14.1  7.44e-7  2.15e9 statistical learning …  1998 21495 <df[,1… <NA>     
#>  8   -14.1  7.22e-7  2.12e9 neural networks a com…  1998 24498 <df[,1… <NA>     
#>  9   -14.2  6.96e-7  1.98e9 generalized gradient …  1996 84892 <df[,1… physical…
#> 10   -14.2  6.86e-7  2.99e9 particle swarm optimi…  1995 12985 <df[,1… <NA>
```

## Calchistogram


```r
res <- ma_calchist(query = "And(Composite(AA.AuN=='jaime teevan'),Y>2012)",
   atts = c('Y', 'F.FN'))
res$histograms$histogram
#> [[1]]
#>   value   logprob count
#> 1  2013 -17.01346    19
#> 2  2014 -17.07550    14
#> 3  2015 -17.42947    15
#> 4  2016 -17.50792    17
#> 5  2019 -17.65841     6
#> 6  2017 -18.09004    11
#> 7  2018 -18.47003     7
#> 8  2020 -18.95307     4
#> 
#> [[2]]
#>                         value   logprob count
#> 1            computer science -15.66718    75
#> 2              world wide web -16.54773    28
#> 3               crowdsourcing -16.63486    24
#> 4  human computer interaction -16.85747    19
#> 5               search engine -17.00135    14
#> 6       information retrieval -17.29366    11
#> 7                  multimedia -17.79757    10
#> 8     artificial intelligence -17.81949     6
#> 9            search analytics -17.83150     5
#> 10               data science -17.90774    11
```

## Abstract


```r
ma_abstract(query = "Y='19'...", count = 5)
#> # A tibble: 4 x 2
#>           Id abstract                                                           
#>        <dbl> <chr>                                                              
#> 1 2119113870 An image forming device has: an image forming body on which an ima…
#> 2 1856219842 Set your standards with these standard methods. This is it: the mo…
#> 3 2156909104 Setting of the learning problem consistency of learning processes …
#> 4 2158714788 The BLAST programs are widely used tools for searching protein and…
```


## Meta

* Please [report any issues or bugs](https://github.com/ropensci/microdemic/issues).
* License: MIT
* Get citation information for `microdemic` in R doing `citation(package = 'microdemic')`
* Please note that this package is released with a [Contributor Code of Conduct](https://ropensci.org/code-of-conduct/). By contributing to this project, you agree to abide by its terms.

[![ropensci_footer](https://ropensci.org/public_images/github_footer.png)](https://ropensci.org)
