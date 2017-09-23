#' Graph search API
#'
#' @export
#' @param query (character) query terms
#' @param mode (character) json (default) or lambda
#' @param key (character) microsoft academic API key, see Details.
#' @param ... curl options passed on to [crul::HttpClient]
#' @references
#' <https://westus.dev.cognitive.microsoft.com/docs/services/56332331778daf02acc0a50b/operations/57e3569ddbe2d91158fa270e>
#' graph search method: <https://docs.microsoft.com/en-us/azure/cognitive-services/academic-knowledge/graphsearchmethod>
#' json search: <https://docs.microsoft.com/en-us/azure/cognitive-services/academic-knowledge/jsonsearchsyntax>
#' lambda search: <https://docs.microsoft.com/en-us/azure/cognitive-services/academic-knowledge/lambdasearchsyntax>
#' @examples \dontrun{
#' x <- '{
#' "path": "/paper/AuthorIDs/author",
#'  "paper": {
#'    "type": "Paper",
#'    "NormalizedTitle": "graph engine",
#'    "select": [ "OriginalTitle" ]
#'  },
#'  "author": {
#'    "return": { "type": "Author", "Name": "bin shao" }
#'  }
#' }'
#'
#' res <- ma_graph_search(query = x)
#' res$Results
#' do.call(rbind, res$Results)
#' }
ma_graph_search <- function(query, mode = "json", key = NULL, ...) {
  assert(mode, "character")
  assert(query, c("character", "json"))

  args <- comp(list(mode = mode))
  ma_HTTP("academic/v1.0/graph/search", args, key, "POST",
          query, encode = "json", ctype = "application/json", ...)
}
