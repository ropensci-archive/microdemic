#' Similarity API
#'
#' @export
#' @param key (character) microsoft academic API key, see Details.
#' @examples \dontrun{
#' ma_similarity(query = "Ti='biology'...")
#' }
ma_similarity <- function() {
  args <- comp(list())
  ma_GET("similarity", args, key, ...)
}
