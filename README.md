microdemic
==========



[![cran checks](https://cranchecks.info/badges/worst/microdemic)](https://cranchecks.info/pkgs/microdemic)
[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![Build Status](https://travis-ci.org/ropensci/microdemic.svg?branch=master)](https://travis-ci.org/ropensci/microdemic)
[![codecov](https://codecov.io/gh/ropensci/microdemic/branch/master/graph/badge.svg)](https://codecov.io/gh/ropensci/microdemic)
[![rstudio mirror downloads](https://cranlogs.r-pkg.org/badges/microdemic)](https://github.com/metacran/cranlogs.app)
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
#> # A tibble: 10 x 349
#>    logprob    prob     Id Ti        Y D        CC DN    S     AA    E     BT   
#>      <dbl>   <dbl>  <dbl> <chr> <int> <chr> <int> <chr> <lis> <lis> <chr> <chr>
#>  1   -13.7 1.17e-6 2.12e9 imag…  1992 1992… 31562 Imag… <df[… <df[… "{\"… <NA> 
#>  2   -13.7 1.13e-6 2.60e9 diag…  1994 1994… 99513 Diag… <NUL… <df[… "{\"… a    
#>  3   -13.7 1.09e-6 1.86e9 stan…  1992 1992… 77188 Stan… <df[… <df[… "{\"… a    
#>  4   -13.7 1.08e-6 2.16e9 the …  1995 1995… 29019 The … <df[… <df[… "{\"… b    
#>  5   -13.8 9.87e-7 2.13e9 crc …  1996 1996… 36272 CRC … <df[… <df[… "{\"… b    
#>  6   -13.8 9.71e-7 2.91e9 fuzz…  1996 1996… 42590 Fuzz… <df[… <df[… "{\"… a    
#>  7   -13.9 9.43e-7 2.16e9 gapp…  1997 1997… 59194 Gapp… <df[… <df[… "{\"… a    
#>  8   -13.9 9.21e-7 2.23e9 manu…  1992 1992… 28470 Manu… <df[… <df[… "{\"… <NA> 
#>  9   -14.1 7.85e-7 2.15e9 stat…  1998 1998… 20944 Stat… <df[… <df[… "{\"… a    
#> 10   -14.1 7.74e-7 2.99e9 part…  1995 1995…   405 Part… <df[… <df[… "{\"… p    
#> # … with 337 more variables: PB <chr>, VFN <chr>, FP <chr>, BV <chr>,
#> #   DOI <chr>, LP <chr>, V <chr>, I <chr>, IA.IndexLength <int>,
#> #   IA.InvertedIndex.An <list>, IA.InvertedIndex.image <list>,
#> #   IA.InvertedIndex.forming <list>, IA.InvertedIndex.device <list>,
#> #   `IA.InvertedIndex.has:` <list>, IA.InvertedIndex.an <list>,
#> #   IA.InvertedIndex.body <list>, IA.InvertedIndex.on <list>,
#> #   IA.InvertedIndex.which <list>, IA.InvertedIndex.is <list>,
#> #   IA.InvertedIndex.formed <list>, IA.InvertedIndex.in <list>,
#> #   IA.InvertedIndex.a <list>, IA.InvertedIndex.state <list>,
#> #   IA.InvertedIndex.the <list>, `IA.InvertedIndex.charged;` <list>,
#> #   IA.InvertedIndex.charging <list>, IA.InvertedIndex.having <list>,
#> #   IA.InvertedIndex.plural <list>, IA.InvertedIndex.discharge <list>,
#> #   `IA.InvertedIndex.portions,` <list>, IA.InvertedIndex.and <list>,
#> #   IA.InvertedIndex.by <list>, IA.InvertedIndex.discharging <list>,
#> #   IA.InvertedIndex.of <list>, `IA.InvertedIndex.portions;` <list>,
#> #   IA.InvertedIndex.control <list>, IA.InvertedIndex.section <list>,
#> #   `IA.InvertedIndex.that,` <list>, IA.InvertedIndex.when <list>,
#> #   `IA.InvertedIndex.body,` <list>, IA.InvertedIndex.operates <list>,
#> #   IA.InvertedIndex.not <list>, IA.InvertedIndex.switches <list>,
#> #   IA.InvertedIndex.between <list>, IA.InvertedIndex.operating <list>,
#> #   IA.InvertedIndex.some <list>, IA.InvertedIndex.portions <list>,
#> #   IA.InvertedIndex.decreasing <list>, IA.InvertedIndex.output <list>,
#> #   IA.InvertedIndex.or <list>, IA.InvertedIndex.stopping <list>,
#> #   IA.InvertedIndex.other <list>, IA.InvertedIndex.than <list>,
#> #   IA.InvertedIndex.portions. <list>, IA.InvertedIndex.Setting <list>,
#> #   IA.InvertedIndex.learning <list>, IA.InvertedIndex.problem <list>,
#> #   IA.InvertedIndex.consistency <list>, IA.InvertedIndex.processes <list>,
#> #   IA.InvertedIndex.bounds <list>, IA.InvertedIndex.rate <list>,
#> #   IA.InvertedIndex.convergence <list>, IA.InvertedIndex.controlling <list>,
#> #   IA.InvertedIndex.generalization <list>, IA.InvertedIndex.ability <list>,
#> #   IA.InvertedIndex.constructing <list>, IA.InvertedIndex.algorithms <list>,
#> #   IA.InvertedIndex.what <list>, IA.InvertedIndex.important <list>,
#> #   `IA.InvertedIndex.theory?.` <list>, IA.InvertedIndex.CRC <list>,
#> #   IA.InvertedIndex.handbook <list>, IA.InvertedIndex.chemistry <list>,
#> #   IA.InvertedIndex.physics <list>, `IA.InvertedIndex.,` <list>,
#> #   IA.InvertedIndex.کتابخانه <list>, IA.InvertedIndex.دیجیتال <list>,
#> #   IA.InvertedIndex.جندی <list>, IA.InvertedIndex.شاپور <list>,
#> #   IA.InvertedIndex.اهواز <list>, IA.InvertedIndex.The <list>,
#> #   IA.InvertedIndex.BLAST <list>, IA.InvertedIndex.programs <list>,
#> #   IA.InvertedIndex.are <list>, IA.InvertedIndex.widely <list>,
#> #   IA.InvertedIndex.used <list>, IA.InvertedIndex.tools <list>,
#> #   IA.InvertedIndex.for <list>, IA.InvertedIndex.searching <list>,
#> #   IA.InvertedIndex.protein <list>, IA.InvertedIndex.DNA <list>,
#> #   IA.InvertedIndex.databases <list>, IA.InvertedIndex.sequence <list>,
#> #   IA.InvertedIndex.similarities. <list>, IA.InvertedIndex.For <list>,
#> #   `IA.InvertedIndex.comparisons,` <list>, IA.InvertedIndex.variety <list>,
#> #   `IA.InvertedIndex.definitional,` <list>,
#> #   IA.InvertedIndex.algorithmic <list>, IA.InvertedIndex.statistical <list>, …
```

## Calchistogram


```r
res <- ma_calchist(query = "And(Composite(AA.AuN=='jaime teevan'),Y>2012)",
   atts = c('Y', 'F.FN'))
res$histograms$histogram
#> [[1]]
#>   value   logprob count
#> 1  2013 -17.02788    19
#> 2  2014 -17.16747    14
#> 3  2015 -17.48570    15
#> 4  2016 -17.58468    17
#> 5  2017 -18.18386    12
#> 6  2019 -18.32731     6
#> 7  2018 -18.56648     7
#> 
#> [[2]]
#>                         value   logprob count
#> 1            computer science -15.74012    81
#> 2  human computer interaction -16.51284    35
#> 3               crowdsourcing -16.68816    24
#> 4              world wide web -16.70398    27
#> 5               search engine -17.07613    14
#> 6       information retrieval -17.23533    17
#> 7                 data mining -17.31724    12
#> 8                  multimedia -17.38984    19
#> 9     artificial intelligence -17.76855     8
#> 10           search analytics -17.87745     5
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
#> 1 2119113870 "An image forming device has: an image forming body on which an im…
#> 2 2596886333 ""                                                                 
#> 3 1856219842 ""                                                                 
#> 4 2156909104 "Setting of the learning problem consistency of learning processes…
#> 5 2132905138 "CRC handbook of chemistry and physics , CRC handbook of chemistry…
```


## Meta

* Please [report any issues or bugs](https://github.com/ropensci/microdemic/issues).
* License: MIT
* Get citation information for `microdemic` in R doing `citation(package = 'microdemic')`
* Please note that this project is released with a [Contributor Code of Conduct][coc]. By participating in this project you agree to abide by its terms.

[![ropensci_footer](https://ropensci.org/public_images/github_footer.png)](https://ropensci.org)

[coc]: https://github.com/ropensci/microdemic/blob/master/CODE_OF_CONDUCT.md
