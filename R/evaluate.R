#' Evaluate API
#'
#' @export
#' @param query (character) query terms
#' @param count (intger) number of records to return. default: 10
#' @param offset (intger) record number to start at. default: 0
#' @param orderby (logical) column by which to order. default: none
#' @param atts (character) fields to return, in a character vector. See
#' <https://docs.microsoft.com/en-us/azure/cognitive-services/academic-knowledge/entityattributes>
#' for details.
#' @param key (character) microsoft academic API key, see Details.
#' @param ... curl options passed on to [crul::HttpClient]
#' @return a list of length two, with `expr` (character) and
#' `entities` (data.frame)
#' @references Query expression syntax
#' https://docs.microsoft.com/en-us/azure/cognitive-services/academic-knowledge/queryexpressionsyntax
#' @examples \dontrun{
#' ma_evaluate(query = "Ti='biology'...")
#' ma_evaluate(query = "Composite(AA.AuN=='jaime teevan')",
#'   atts = c('Id', 'AA.AuN'))
#' ma_evaluate(query = "Y=2010", atts = c('Id', 'Y'))
#' ma_evaluate(query = "Y=[2010, 2012)", atts = c('Id', 'Y'))
#' ma_evaluate(query = "D=['2010-02-03','2010-02-05']", atts = c('Id', 'Y'))
#' x <- "Composite(And(AA.AuN='mike smith',AA.AfN='harvard university'))"
#' ma_evaluate(x)
#' }
ma_evaluate <- function(query, count = 10, offset = 0, orderby = NULL,
  atts = c("Id", "AA.AuN", "J.JN", "Ti", "Y", "E", "CC"), key = NULL, ...) {

  if (!is.null(atts)) atts <- paste0(atts, collapse = ",")
  args <- comp(list(expr = query, count = count, offset = offset,
                          orderby = orderby, attributes = atts))
  tibble::as_tibble(
    ma_HTTP("academic/v1.0/evaluate", args, key, ...)$entities
  )
}
