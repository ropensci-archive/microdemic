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
ma_abstract(query = "Ti='biology'...", count = 3)
#> [1] "This review focuses on the mechanisms regulating the synthesis, secretion, biological actions, and therapeutic relevance of the incretin peptides glucose-dependent insulinotropic polypeptide (GIP) and glucagon-like peptide-1 (GLP-1). The published literature was reviewed, with emphasis on recent advances in our understanding of the biology of GIP and GLP-1. GIP and GLP-1 are both secreted within minutes of nutrient ingestion and facilitate the rapid disposal of ingested nutrients. Both peptides share common actions on islet β-cells acting through structurally distinct yet related receptors. Incretin-receptor activation leads to glucose-dependent insulin secretion, induction of β-cell proliferation, and enhanced resistance to apoptosis. GIP also promotes energy storage via direct actions on adipose tissue, and enhances bone formation via stimulation of osteoblast proliferation and inhibition of apoptosis. In contrast, GLP-1 exerts glucoregulatory actions via slowing of gastric emptying and glucose-dependent inhibition of glucagon secretion. GLP-1 also promotes satiety and sustained GLP-1–receptor activation is associated with weight loss in both preclinical and clinical studies. The rapid degradation of both GIP and GLP-1 by the enzyme dipeptidyl peptidase-4 has led to the development of degradation-resistant GLP-1–receptor agonists and dipeptidyl peptidase-4 inhibitors for the treatment of type 2 diabetes. These agents decrease hemoglobin A1c (HbA1c) safely without weight gain in subjects with type 2 diabetes. GLP-1 and GIP integrate nutrient-derived signals to control food intake, energy absorption, and assimilation. Recently approved therapeutic agents based on potentiation of incretin action provide new physiologically based approaches for the treatment of type 2 diabetes."
#> [2] "Once a poorly defined pathologic oddity, in recent years, gastrointestinal stromal tumor (GIST) has emerged as a distinct oncogenetic entity that is now center stage in clinical trials of kinase-targeted therapies. This review charts the rapid progress that has established GIST as a model for understanding the role of oncogenic kinase mutations in human tumorigenesis. Approximately 80% to 85% of GISTs harbor activating mutations of the KIT tyrosine kinase. In a series of 322 GISTs (including 140 previously published cases) studied by the authors in detail, mutations in the KIT gene occurred with decreasing frequency in exons 11 (66.1%), 9 (13%), 13 (1.2%), and 17 (0.6%). In the same series, a subset of tumors had mutations in the KIT-related kinase gene PDGF receptor alpha (PDGFRA), which occurred in either exon 18 (5.6%) or 12 (1.5%). The remainder of GISTs (12%) were wild type for both KIT and PDGFRA. Comparative studies of KIT-mutant, PDGFRA-mutant, and wild-type GISTs indicate that there are many simi..."                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
#> [3] "As they grapple with increasingly large data sets, biologists and computer scientists uncork new bottlenecks."
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
