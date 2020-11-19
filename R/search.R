#' Search - higher level method
#'
#' @export
#' @inheritParams ma_evaluate
#' @references
#' https://academic.microsoft.com/
#' https://www.microsoft.com/en-us/research/project/academic-knowledge/
#' https://docs.microsoft.com/en-us/academic-services/project-academic-knowledge/introduction
#' @examples \dontrun{
#' ma_search(query = "Y='19'...")
#' }
ma_search <- function(query, count = 10, offset = 0, orderby = NULL,
                      atts = c("Id", "AA.AuN", "J.JN", "Ti", "Y", "CC"),
                      model = "latest", key = NULL, ...) {

  if (!is.null(atts)) atts <- paste0(atts, collapse = ",")
  out <- ma_evaluate(query, count, offset, orderby, atts, model, key, ...)
  out$E <- NULL
  out[grepl("IA.+", names(out))] <- NULL
  out[grepl("CitCon.+", names(out))] <- NULL
  return(out)
}
