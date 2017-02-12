#' Abstracts
#'
#' @export
#' @param key (character) microsoft academic API key, see Details.
#' @examples \dontrun{
#' ma_abstract(query = "Ti='biology'...")
#' }
ma_abstract <- function(query, key = NULL, ...) {
  ma_search(query = query, key = key, atts = c("Id", "E"))$D
}
