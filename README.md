microdemic
==========



[![Build Status](https://api.travis-ci.org/ropenscilabs/microdemic.png?branch=master)](https://travis-ci.org/ropenscilabs/microdemic)

`microdemic` - Microsoft Academic Client

API docs: <https://azure.microsoft.com/en-us/services/cognitive-services/academic-knowledge/>

Get a API key at <https://azure.microsoft.com/en-us/try/cognitive-services/>

## install

cran version


```r
install.packages("microdemic")
```

dev version


```r
devtools::install_github("ropenscilabs/microdemic")
```


```r
library("microdemic")
```

## Interpret


```r
res <- ma_interpret(query = "papers by jaime'...")
(expr <- res$interpretations$rules[[1]]$output.value)
#> [1] "Composite(AA.AuN=='j p gomez')"
```

## Evaluate


```r
ma_evaluate(expr)
#> # A tibble: 10 x 8
#>    logprob         Id
#>  *   <dbl>      <dbl>
#>  1 -15.040 2167727518
#>  2 -17.552 2079479731
#>  3 -17.726 2145474863
#>  4 -17.877 1957266799
#>  5 -17.904 2274423721
#>  6 -17.933 2152231764
#>  7 -17.983 2135463293
#>  8 -18.025 1529468456
#>  9 -18.247 2110555172
#> 10 -18.261 2139967537
#> # ... with 6 more variables: E <chr>, Ti <chr>, Y <int>, CC <int>,
#> #   AA <list>, J.JN <chr>
```

or go to evalulate directly


```r
ma_evaluate(query = "Ti='biology'...")
#> # A tibble: 10 x 8
#>    logprob         Id
#>  *   <dbl>      <int>
#>  1 -16.734 2084948079
#>  2 -17.236 2101214437
#>  3 -17.297 2081930221
#>  4 -17.428 2081365151
#>  5 -17.455 2099299146
#>  6 -17.481  279337373
#>  7 -17.571 1857453373
#>  8 -17.588 2141869972
#>  9 -17.627 2046020682
#> 10 -17.637 2133469996
#> # ... with 6 more variables: E <chr>, Ti <chr>, Y <int>, CC <int>,
#> #   AA <list>, J.JN <chr>
```

## Calchistogram


```r
res <- ma_calchist(query = "And(Composite(AA.AuN=='jaime teevan'),Y>2012)",
   atts = c('Y', 'F.FN'))
res$histograms$histogram
#> [[1]]
#>   value logprob count
#> 1  2013 -17.058    18
#> 2  2014 -17.287    13
#> 3  2016 -17.861    16
#> 4  2015 -17.924    13
#> 5  2017 -18.591     9
#> 
#> [[2]]
#>                    value logprob count
#> 1       computer science -16.468    43
#> 2         world wide web -16.517    33
#> 3            data mining -16.668    28
#> 4             simulation -17.232    20
#> 5             multimedia -17.303    22
#> 6          crowdsourcing -17.404    16
#> 7  information retrieval -17.443    11
#> 8       internet privacy -17.729     7
#> 9          search engine -17.937     7
#> 10      machine learning -18.014     6
```


## Meta

* Please [report any issues or bugs](https://github.com/ropenscilabs/microdemic/issues).
* License: MIT
* Get citation information for `microdemic` in R doing `citation(package = 'microdemic')`
* Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
