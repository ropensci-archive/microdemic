#' Fetch abstracts
#'
#' @export
#' @inheritParams ma_search
#' @examples \dontrun{
#' ma_abstract(query = "Ti='biology'...", count = 10)
#' ma_abstract(query = "Ti='ecology'...", count = 10)
#' }
ma_abstract <- function(query, count = 10, offset = 0, orderby = NULL,
                        key = NULL, ...) {
  out <- ma_evaluate(query, count, offset, orderby, c("Id", "E"), key, ...)
  unname(vapply(out$E, function(z) invabs2abs(jsonlite::fromJSON(z)$IA), ""))
}

invabs2abs <- function(x) {
  x$InvertedIndex <- lapply(x$InvertedIndex, `+`, 1)
  ab <- c()
  for (i in names(x$InvertedIndex)) {
    for (j in x$InvertedIndex[[i]]) {
      ab[j] <- i
    }
  }
  paste(ab, collapse = " ")
}
