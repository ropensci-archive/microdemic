microdemic
==========



[![cran checks](https://cranchecks.info/badges/worst/microdemic)](https://cranchecks.info/pkgs/microdemic)
[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)
[![Build Status](https://travis-ci.org/ropensci/microdemic.svg?branch=master)](https://travis-ci.org/ropensci/microdemic)
[![codecov](https://codecov.io/gh/ropensci/microdemic/branch/master/graph/badge.svg)](https://codecov.io/gh/ropensci/microdemic)
[![rstudio mirror downloads](https://cranlogs.r-pkg.org/badges/microdemic)](https://github.com/metacran/cranlogs.app)
[![cran version](https://www.r-pkg.org/badges/version/microdemic)](https://cran.r-project.org/package=microdemic)

`microdemic` - Microsoft Academic Client

API docs: <https://dev.labs.cognitive.microsoft.com/docs/services/56332331778daf02acc0a50b/operations/565d9001ca73072048922d97>

Get a API key at <https://labs.cognitive.microsoft.com/en-us/subscriptions>

## install

cran version


```r
install.packages("microdemic")
```

dev version


```r
devtools::install_github("ropensci/microdemic")
```


```r
library("microdemic")
```

## Interpret


```r
res <- ma_interpret(query = "papers by jaime'...")
(expr <- res$interpretations$rules[[1]]$output.value)
#> [1] "Composite(AA.AuN=='jaime herrera acosta')"
```

## Evaluate


```r
ma_evaluate(expr)
#> # A tibble: 10 x 8
#>    logprob      Id Ti                 Y    CC AA      E             J.JN  
#>  *   <dbl>   <dbl> <chr>          <int> <int> <list>  <chr>         <chr> 
#>  1   -15.1  2.49e9 k doqi clinic…  2002  8642 <data.… "{\"DN\":\"K… amer …
#>  2   -18.1  2.24e9 k doqi clinic…  2002   391 <data.… "{\"DN\":\"K… amer …
#>  3   -18.8  2.12e9 essential hyp…  2005   300 <data.… "{\"DN\":\"E… j ame…
#>  4   -20.0  1.60e9 re encuesta n…  2005    32 <data.… "{\"DN\":\"R… rev p…
#>  5   -21.9  2.03e9 hypertension …  1982    96 <data.… "{\"DN\":\"H… kidne…
#>  6   -23.8  8.22e8 mecanismos es…  2004     1 <data.… "{\"DN\":\"M… rev p…
#>  7   -23.9  2.20e9 hipertension …  2001     2 <data.… "{\"DN\":\"H… rev p…
#>  8   -24.2  2.34e9 hipertension …  2003     1 <data.… "{\"DN\":\"H… rev p…
#>  9   -24.9  2.24e9 la inhibicion…  1987     1 <data.… "{\"DN\":\"L… rev i…
#> 10   -25.3  2.26e9 revasculariza…  1987     0 <data.… "{\"DN\":\"R… <NA>
```

or go to evalulate directly


```r
ma_evaluate(query = "Y='19'...")
#> # A tibble: 10 x 8
#>    logprob      Id Ti                 Y     CC AA      E             J.JN 
#>  *   <dbl>   <dbl> <chr>          <int>  <int> <list>  <chr>         <chr>
#>  1   -13.1  2.14e9 molecular clo…  1989 182096 <data.… "{\"DN\":\"M… <NA> 
#>  2   -13.6  2.60e9 diagnostic an…  1994 127551 <data.… "{\"DN\":\"D… <NA> 
#>  3   -13.8  1.86e9 standard meth…  1992  80778 <data.… "{\"DN\":\"S… <NA> 
#>  4   -13.8  2.34e9 fuzzy sets      1996  67563 <data.… "{\"DN\":\"F… <NA> 
#>  5   -13.9  2.16e9 gapped blast …  1997  67879 <data.… "{\"DN\":\"G… nar  
#>  6   -13.9  2.89e9 computers and…  1999  56637 <data.… "{\"DN\":\"C… <NA> 
#>  7   -13.9  2.16e9 the nature of…  1995  67809 <data.… "{\"DN\":\"T… <NA> 
#>  8   -14.1  2.23e9 manufacture o…  1986  54405 <data.… "{\"DN\":\"M… <NA> 
#>  9   -14.2  2.15e9 particle swar…  1995  48823 <data.… "{\"DN\":\"P… <NA> 
#> 10   -14.2  2.43e9 numerical rec…  1988 125682 <data.… "{\"DN\":\"N… <NA>
```

## Calchistogram


```r
res <- ma_calchist(query = "And(Composite(AA.AuN=='jaime teevan'),Y>2012)",
   atts = c('Y', 'F.FN'))
res$histograms$histogram
#> [[1]]
#>   value logprob count
#> 1  2013 -17.240    18
#> 2  2014 -17.332    13
#> 3  2016 -17.818    16
#> 4  2015 -17.832    14
#> 5  2017 -18.709    12
#> 6  2018 -19.532     3
#> 
#> [[2]]
#>                         value logprob count
#> 1            computer science -16.111    64
#> 2                 data mining -16.771    28
#> 3               crowdsourcing -16.992    23
#> 4               search engine -17.076    16
#> 5  human computer interaction -17.461    18
#> 6       information retrieval -17.484    15
#> 7                  multimedia -17.681    16
#> 8            search analytics -18.065     5
#> 9        knowledge management -18.184     8
#> 10               social media -18.382     6
```

## Similarity


```r
s1 <- "Using complementary priors, we derive a fast greedy algorithm that
can learn deep directed belief networks one layer at a time, provided the
top two layers form an undirected associative memory"
s2 <- "Deepneural nets with a large number of parameters are very powerful
machine learning systems. However, overfitting is a serious problem in
such networks"
ma_similarity(s1, s2)
#> [1] 0.6254586
```

## Abstract


```r
ma_abstract(query = "Y='19'...", count = 5)
#> # A tibble: 5 x 2
#>           Id abstract                                                     
#>        <dbl> <chr>                                                        
#> 1 2144634347 Molecular Cloning has served as the foundation of technical …
#> 2 2596886333 ""                                                           
#> 3 1856219842 Apresenta as metodologias desenvolvidas em grande escala par…
#> 4 2339804494 ""                                                           
#> 5 2158714788 The BLAST programs are widely used tools for searching prote…
```


## Meta

* Please [report any issues or bugs](https://github.com/ropensci/microdemic/issues).
* License: MIT
* Get citation information for `microdemic` in R doing `citation(package = 'microdemic')`
* Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.

[![ropensci_footer](https://ropensci.org/public_images/github_footer.png)](https://ropensci.org)
