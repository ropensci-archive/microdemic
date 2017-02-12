#' Interpret API
#'
#' @export
#' @param query (character) query terms
#' @param count (intger) number of records to return. default: 10
#' @param offset (intger) record number to start at. default: 0
#' @param complete (logical) record to start at. default: 0
#' @param key (character) microsoft academic API key, see Details.
#' @examples \dontrun{
#' ma_interpret(query = "Ti='biology'...")
#' }
ma_interpret <- function(query, count = 10, complete = TRUE, key, ...) {
  compolete <- if (complete) 1 else 0
  args <- comp(list(query = query, complete = complete, count = count,
               offset = offset, model = "latest"))
  ma_GET("interpret", args, key, ...)
}
