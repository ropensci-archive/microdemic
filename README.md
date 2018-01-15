microdemic
==========



[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)
[![Build Status](https://travis-ci.org/ropenscilabs/microdemic.svg?branch=master)](https://travis-ci.org/ropenscilabs/microdemic)
[![codecov](https://codecov.io/gh/ropenscilabs/microdemic/branch/master/graph/badge.svg)](https://codecov.io/gh/ropenscilabs/microdemic)
[![cran version](https://www.r-pkg.org/badges/version/microdemic)](https://cran.r-project.org/package=microdemic)

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
#> [1] "Composite(AA.AuN=='j simpson')"
```

## Evaluate


```r
ma_evaluate(expr)
#> # A tibble: 10 x 8
#>    logprob         Id Ti         Y    CC AA    E                     J.JN 
#>  *   <dbl>      <dbl> <chr>  <int> <int> <lis> <chr>                 <chr>
#>  1   -14.9 2337454357 inten…  1998 13261 <dat… "{\"DN\":\"Intensive… lanc…
#>  2   -17.8 2122159856 agata…  2012   139 <dat… "{\"DN\":\"AGATA - A… nucl…
#>  3   -18.0 2567424265 regre…  2016    79 <dat… "{\"DN\":\"Regressio… n en…
#>  4   -18.2 2018655931 effec…  1995   812 <dat… "{\"DN\":\"Effect of… j bi…
#>  5   -18.3 1507854122 the u…  2002   413 <dat… "{\"DN\":\"The use o… clin…
#>  6   -18.6 2066093376 inter…  2008   205 <dat… "{\"DN\":\"Interpret… brit…
#>  7   -18.7 2035651919 diffe…  2005   243 <dat… "{\"DN\":\"Different… biom…
#>  8   -18.8 2049816406 surfa…  1996   457 <dat… "{\"DN\":\"Surface r… j bi…
#>  9   -18.9 2038399305 from …  2008    65 <dat… "{\"DN\":\"From Ge(L… prog…
#> 10   -19.0 2165320653 a pha…  2006   248 <dat… "{\"DN\":\"A Phase I… clin…
```

or go to evalulate directly


```r
ma_evaluate(query = "Y='19'...")
#> # A tibble: 10 x 8
#>    logprob         Id Ti         Y     CC AA    E                    J.JN 
#>  *   <dbl>      <dbl> <chr>  <int>  <int> <lis> <chr>                <chr>
#>  1   -13.1 2144634347 molec…  1989 125571 <dat… "{\"DN\":\"Molecula… <NA> 
#>  2   -13.6 2596886333 diagn…  1994  88682 <dat… "{\"DN\":\"Diagnost… <NA> 
#>  3   -13.8 2339804494 fuzzy…  1996  36075 <dat… "{\"DN\":\"Fuzzy se… <NA> 
#>  4   -13.8 2156909104 the n…  1995  27342 <dat… "{\"DN\":\"The natu… tech…
#>  5   -13.9 2158714788 gappe…  1997  52865 <dat… "{\"DN\":\"Gapped B… nar  
#>  6   -13.9 1856219842 stand…  1992  56992 <dat… "{\"DN\":\"Standard… <NA> 
#>  7   -14.1 2132905138 crc h…  1990  37155 <dat… "{\"DN\":\"CRC Hand… <NA> 
#>  8   -14.2 2623205651 quant…  1993  15172 <dat… "{\"DN\":\"Quantum … <NA> 
#>  9   -14.2 2152195021 parti…  1995  26464 <dat… "{\"DN\":\"Particle… <NA> 
#> 10   -14.2 2148603752 stati…  1998  18218 <dat… "{\"DN\":\"Statisti… <NA>
```

## Calchistogram


```r
res <- ma_calchist(query = "And(Composite(AA.AuN=='jaime teevan'),Y>2012)",
   atts = c('Y', 'F.FN'))
res$histograms$histogram
#> [[1]]
#>   value logprob count
#> 1  2013 -17.060    19
#> 2  2014 -17.273    13
#> 3  2016 -17.918    16
#> 4  2015 -17.998    13
#> 5  2017 -18.562    11
#> 
#> [[2]]
#>                         value logprob count
#> 1            computer science -16.172    56
#> 2                 data mining -16.833    25
#> 3               search engine -17.220    13
#> 4               crowdsourcing -17.299    19
#> 5       information retrieval -17.326    14
#> 6                       crowd -17.416    16
#> 7  human computer interaction -17.639    18
#> 8                  multimedia -17.783    13
#> 9              world wide web -18.070     5
#> 10           search analytics -18.072     5
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
res <- ma_abstract(query = "Y='19'...", count = 5)
Filter(nzchar, res)
#> [1] "Molecular Cloning has served as the foundation of technical expertise in labs worldwide for 30 years. No other manual has been so popular, or so influential. Molecular Cloning, Fourth Edition, by the celebrated founding author Joe Sambrook and new co-author, the distinguished HHMI investigator Michael Green, preserves the highly praised detail and clarity of previous editions and includes specific chapters and protocols commissioned for the book from expert practitioners at Yale, U Mass, Rockefeller University, Texas Tech, Cold Spring Harbor Laboratory, Washington University, and other leading institutions. The theoretical and historical underpinnings of techniques are prominent features of the presentation throughout, information that does much to help trouble-shoot experimental problems. For the fourth edition of this classic work, the content has been entirely recast to include nucleic-acid based methods selected as the most widely used and valuable in molecular and cellular biology laboratories. Core chapters from the third edition have been revised to feature current strategies and approaches to the preparation and cloning of nucleic acids, gene transfer, and expression analysis. They are augmented by 12 new chapters which show how DNA, RNA, and proteins should be prepared, evaluated, and manipulated, and how data generation and analysis can be handled. The new content includes methods for studying interactions between cellular components, such as microarrays, next-generation sequencing technologies, RNA interference, and epigenetic analysis using DNA methylation techniques and chromatin immunoprecipitation. To make sense of the wealth of data produced by these techniques, a bioinformatics chapter describes the use of analytical tools for comparing sequences of genes and proteins and identifying common expression patterns among sets of genes. Building on thirty years of trust, reliability, and authority, the fourth edition of Mol"
#> [2] "Setting of the learning problem consistency of learning processes bounds on the rate of convergence of learning processes controlling the generalization ability of learning processes constructing learning algorithms what is important in learning theory?."                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
#> [3] "The BLAST programs are widely used tools for searching protein and DNA databases for sequence similarities. For protein comparisons, a variety of definitional, algorithmic and statistical refinements described here permits the execution time of the BLAST programs to be decreased substantially while enhancing their sensitivity to weak similarities. A new criterion for triggering the extension of word hits, combined with a new heuristic for generating gapped alignments, yields a gapped BLAST program that runs at approximately three times the speed of the original. In addition, a method is introduced for automatically combining statistically significant alignments produced by BLAST into a position-specific score matrix, and searching the database using this matrix. The resulting Position-Specific Iterated BLAST (PSIBLAST) program runs at approximately the same speed per iteration as gapped BLAST, but in many cases is much more sensitive to weak but biologically relevant sequence similarities. PSI-BLAST is used to uncover several new and interesting members of the BRCT superfamily."
```

## Graph search


```r
x <- '{
"path": "/paper/AuthorIDs/author",
 "paper": {
   "type": "Paper",
   "NormalizedTitle": "graph engine",
   "select": [ "OriginalTitle" ]
 },
 "author": {
   "return": { "type": "Author", "Name": "bin shao" }
 }
}'
ma_graph_search(query = x)
#> $Results
#> $Results[[1]]
#>       CellID            OriginalTitle
#> 1   73304046 The Trinity Graph Engine
#> 2 2093502026                     <NA>
#> 
#> $Results[[2]]
#>       CellID                                     OriginalTitle
#> 1 2171539317 A distributed graph engine for web scale RDF data
#> 2 2093502026                                              <NA>
```


## Meta

* Please [report any issues or bugs](https://github.com/ropenscilabs/microdemic/issues).
* License: MIT
* Get citation information for `microdemic` in R doing `citation(package = 'microdemic')`
* Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
