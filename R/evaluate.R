#' Interpret API
#'
#' @export
#' @param query (character) query terms
#' @param count (intger) number of records to return. default: 10
#' @param offset (intger) record number to start at. default: 0
#' @param complete (logical) record to start at. default: 0
#' @param orderby (logical) column by which to order. default: none
#' @param atts (character) fields to return, in a character vector. See
#' XX for details.
#' @param key (character) microsoft academic API key, see Details.
#' @examples \dontrun{
#' ma_evaluate(query = "Ti='biology'...")
#' }
ma_evaluate <- function(query, count = 10, offset = 0, orderby = NULL,
  atts = c("Id", "AA.AuN", "J.JN", "Ti", "Y", "E", "CC"), key = NULL, ...) {

  args <- comp(list(expr = query, count = count, offset = offset,
                          orderby = orderby, attributes = atts))
  ma_GET("evaluate", args, key, ...)
}
