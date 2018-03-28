microdemic
==========



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
#> [1] "Composite(AA.AuN=='j simpson')"
```

## Evaluate


```r
ma_evaluate(expr)
#> # A tibble: 10 x 8
#>    logprob          Id Ti         Y    CC AA    E                    J.JN 
#>  *   <dbl>       <dbl> <chr>  <int> <int> <lis> <chr>                <chr>
#>  1   -14.9 2337454357. inten…  1998 13281 <dat… "{\"DN\":\"Intensiv… lanc…
#>  2   -17.8 2122159856. agata…  2012   140 <dat… "{\"DN\":\"AGATA - … nucl…
#>  3   -17.9 2567424265. regre…  2016    90 <dat… "{\"DN\":\"Regressi… n en…
#>  4   -18.2 2018655931. effec…  1995   811 <dat… "{\"DN\":\"Effect o… j bi…
#>  5   -18.3 1507854122. the u…  2002   412 <dat… "{\"DN\":\"The use … clin…
#>  6   -18.6 2066093376. inter…  2008   207 <dat… "{\"DN\":\"Interpre… brit…
#>  7   -18.7 2035651919. diffe…  2005   242 <dat… "{\"DN\":\"Differen… biom…
#>  8   -18.8 2049816406. surfa…  1996   458 <dat… "{\"DN\":\"Surface … j bi…
#>  9   -19.0 2038399305. from …  2008    65 <dat… "{\"DN\":\"From Ge(… prog…
#> 10   -19.0 2125111321. isola…  2011    85 <dat… "{\"DN\":\"Isolated… circ…
```

or go to evalulate directly


```r
ma_evaluate(query = "Y='19'...")
#> # A tibble: 10 x 8
#>    logprob          Id Ti         Y     CC AA    E                   J.JN 
#>  *   <dbl>       <dbl> <chr>  <int>  <int> <lis> <chr>               <chr>
#>  1   -13.1 2144634347. molec…  1989 126083 <dat… "{\"DN\":\"Molecul… <NA> 
#>  2   -13.6 2596886333. diagn…  1994  89916 <dat… "{\"DN\":\"Diagnos… <NA> 
#>  3   -13.8 2339804494. fuzzy…  1996  36215 <dat… "{\"DN\":\"Fuzzy s… <NA> 
#>  4   -13.8 2156909104. the n…  1995  27504 <dat… "{\"DN\":\"The nat… tech…
#>  5   -13.9 2158714788. gappe…  1997  53035 <dat… "{\"DN\":\"Gapped … nar  
#>  6   -13.9 1856219842. stand…  1992  57527 <dat… "{\"DN\":\"Standar… <NA> 
#>  7   -14.1 2132905138. crc h…  1990  37782 <dat… "{\"DN\":\"CRC Han… <NA> 
#>  8   -14.2 2623205651. quant…  1993  15322 <dat… "{\"DN\":\"Quantum… <NA> 
#>  9   -14.2 2152195021. parti…  1995  26555 <dat… "{\"DN\":\"Particl… <NA> 
#> 10   -14.2 2148603752. stati…  1998  18273 <dat… "{\"DN\":\"Statist… <NA>
```

## Calchistogram


```r
res <- ma_calchist(query = "And(Composite(AA.AuN=='jaime teevan'),Y>2012)",
   atts = c('Y', 'F.FN'))
res$histograms$histogram
#> [[1]]
#>   value logprob count
#> 1  2013 -17.105    18
#> 2  2014 -17.315    13
#> 3  2015 -17.961    13
#> 4  2016 -18.016    16
#> 5  2017 -19.015    11
#> 
#> [[2]]
#>                         value logprob count
#> 1            computer science -16.227    55
#> 2                 data mining -16.779    26
#> 3               crowdsourcing -17.163    20
#> 4               search engine -17.218    13
#> 5       information retrieval -17.363    13
#> 6  human computer interaction -17.656    18
#> 7                  multimedia -17.810    13
#> 8            search analytics -18.091     5
#> 9              world wide web -18.096     5
#> 10             social network -18.244     5
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

* Please [report any issues or bugs](https://github.com/ropensci/microdemic/issues).
* License: MIT
* Get citation information for `microdemic` in R doing `citation(package = 'microdemic')`
* Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.

[![ropensci_footer](https://ropensci.org/public_images/github_footer.png)](https://ropensci.org)
