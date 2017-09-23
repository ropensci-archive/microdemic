#' CalcHistogram API
#'
#' @export
#' @inheritParams ma_evaluate
#' @examples \dontrun{
#' res <- ma_calchist(query = "And(Composite(AA.AuN=='jaime teevan'),Y>2012)",
#'   atts = c('Y', 'F.FN'))
#' res$histograms$histogram
#' }
ma_calchist <- function(query, count = 10, offset = 0,
  atts = c("Id", "AA.AuN", "J.JN", "Ti", "Y", "E", "CC"), key = NULL, ...) {

  if (!is.null(atts)) atts <- paste0(atts, collapse = ",")
  args <- comp(list(expr = query, count = count, offset = offset,
                    attributes = atts))
  ma_HTTP("academic/v1.0/calchistogram", args, key, ...)
}
