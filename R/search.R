#' Search - higher level method
#'
#' @export
#' @inheritParams ma_evaluate
#' @references
#' https://academic.microsoft.com/
#' https://azure.microsoft.com/en-us/services/cognitive-services/academic-knowledge/
#' https://docs.microsoft.com/en-us/azure/cognitive-services/academic-knowledge/home
#' https://westus.dev.cognitive.microsoft.com/docs/services/56332331778daf02acc0a50b/operations/565d9001ca73072048922d97
#' https://westus.dev.cognitive.microsoft.com/docs/services/56332331778daf02acc0a50b/operations/565d753be597ed16ac3ffc03
#' @examples \dontrun{
#' ma_search(query = "Y='19'...")
#' }
ma_search <- function(query, count = 10, offset = 0, orderby = NULL,
                      atts = c("Id", "AA.AuN", "J.JN", "Ti", "Y", "E", "CC"),
                      model = "latest", key = NULL, ...) {

  if (!is.null(atts)) atts <- paste0(atts, collapse = ",")
  out <- ma_evaluate(query, count, offset, orderby, atts, model, key, ...)
  out$E <- NULL
  out[grepl("IA.+", names(out))] <- NULL
  out[grepl("CitCon.+", names(out))] <- NULL
  return(out)
}
