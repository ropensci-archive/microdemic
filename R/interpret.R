#' Interpret API
#'
#' @export
#' @inheritParams ma_evaluate
#' @param complete (logical) `TRUE` means that auto-completion suggestions
#' are generated based on the grammar and graph data. default: `TRUE`
#' @references <https://docs.microsoft.com/en-us/azure/cognitive-services/academic-knowledge/interpretmethod>
#' @examples \dontrun{
#' res <- ma_interpret(query = "papers by jaime'...")
#' res$query
#' res$interpretations
#' res$interpretations$parse
#' res$interpretations$rules
#' res$interpretations$rules[[1]]
#'
#' expr <- res$interpretations$rules[[1]]$output.value
#' ma_evaluate(expr)
#' }
ma_interpret <- function(query, count = 10, offset = 0, complete = TRUE,
                         key = NULL, ...) {
  complete <- if (complete) 1 else 0
  args <- comp(list(query = query, complete = complete, count = count,
               offset = offset, model = "latest"))
  ma_HTTP("academic/v1.0/interpret", args, key, ...)
}
