#' Fetch abstracts
#'
#' @export
#' @inheritParams ma_search
#' @return data.frame, with two columns: `Id` and `abstract`
#' @note articles without abstract are removed, so number returned
#' may not equal number requestd with the `count` parameter
#' @examples \dontrun{
#' ma_abstract(query = "Y=2010", count = 10)
#' ma_abstract(query = "Y=[2010, 2012)", count = 10)
#' }
ma_abstract <- function(query, count = 10, offset = 0, orderby = NULL,
                        model = "latest", key = NULL, ...) {
  args <- comp(list(expr = query, count = count, offset = offset,
    orderby = orderby, attributes = "Id,IA", model = model))
  res <- ma_HTTP("academic/v1.0/evaluate", args, key, parse=FALSE, ...)
  ents <- jsonlite::fromJSON(res, FALSE)$entities
  ents <- Filter(function(w) "IA" %in% names(w), ents)
  tmp <- unname(vapply(ents, function(z) invabs2abs(z$IA), ""))
  tibble::as_tibble(data.frame(Id = unlist(lapply(ents, "[[", "Id")),
    abstract = tmp, stringsAsFactors = FALSE))
}

invabs2abs <- function(x) {
  invin <- list()
  for (i in seq_along(x$InvertedIndex)) {
    invin[[ names(x$InvertedIndex)[i] ]] <- unlist(x$InvertedIndex[[i]])
  }
  invin <- lapply(invin, `+`, 1)
  ab <- c()
  for (i in names(invin)) {
    for (j in invin[[i]]) {
      ab[j] <- i
    }
  }
  if (!is.null(ab)) {
    ab <- ab[!is.na(ab)]
  }
  paste(ab, collapse = " ")
}
