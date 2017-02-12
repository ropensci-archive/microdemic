#' CalcHistogram API
#'
#' @export
#' @param key (character) microsoft academic API key, see Details.
#' @examples \dontrun{
#' ma_calchist(query = "Ti='biology'...")
#' }
ma_calchist <- function() {
  args <- comp(list())
  ma_GET("calchistogram", args, key, ...)
}
