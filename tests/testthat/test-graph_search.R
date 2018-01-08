# context("ma_graph_search")

# test_that("ma_graph_search works as expected", {
#   skip_on_cran()
#   Sys.sleep(1)

#   x <- '{
#   "path": "/paper/AuthorIDs/author",
#    "paper": {
#      "type": "Paper",
#      "NormalizedTitle": "graph engine",
#      "select": [ "OriginalTitle" ]
#    },
#    "author": {
#      "return": { "type": "Author", "Name": "bin shao" }
#    }
#   }'

#   aa <- ma_graph_search(query = x)

#   expect_is(aa, "list")
#   expect_named(aa, 'Results')
#   expect_named(aa$Results[[1]], c('CellID', 'OriginalTitle'))
# })
