#' Fetch abstracts
#'
#' @export
#' @inheritParams ma_search
#' @return data.frame, with two columns: `Id` and `abstract`
#' @examples \dontrun{
#' ma_abstract(query = "Y=2010", count = 10)
#' ma_abstract(query = "Y=[2010, 2012)", count = 10)
#' }
ma_abstract <- function(query, count = 10, offset = 0, orderby = NULL,
                        model = "latest", key = NULL, ...) {
  out <- ma_evaluate(query, count, offset, orderby, c("Id", "E"), 
    model, key, ...)
  tmp <- unname(
    vapply(out$E, function(z) invabs2abs(jsonlite::fromJSON(z)$IA), ""))
  tibble::as_tibble(data.frame(Id = out$Id, abstract = tmp, 
    stringsAsFactors = FALSE))
}

invabs2abs <- function(x) {
  x$InvertedIndex <- lapply(x$InvertedIndex, `+`, 1)
  ab <- c()
  for (i in names(x$InvertedIndex)) {
    for (j in x$InvertedIndex[[i]]) {
      ab[j] <- i
    }
  }
  if (!is.null(ab)) {
    ab <- ab[!is.na(ab)]
  }
  paste(ab, collapse = " ")
}
