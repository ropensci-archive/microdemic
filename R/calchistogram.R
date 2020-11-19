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
  atts = c("Id", "AA.AuN", "J.JN", "Ti", "Y", "CC"), model = "latest", 
  key = NULL, ...) {

  assert(model, "character")
  if (!model %in% c('latest', 'beta-2015')) {
    stop("model must be one or 'latest' or 'beta-2015'")
  }    
  if (!is.null(atts)) atts <- paste0(atts, collapse = ",")
  args <- comp(list(expr = query, count = count, offset = offset,
                    attributes = atts, model = model))
  ma_HTTP("academic/v1.0/calchistogram", args, key, ...)
}
