#' Evaluate API
#'
#' @export
#' @param query (character) query terms
#' @param count (intger) number of records to return. default: 10
#' @param offset (intger) record number to start at. default: 0
#' @param orderby (logical) column by which to order. default: none
#' @param atts (character) fields to return, in a character vector. See
#' https://docs.microsoft.com/en-us/academic-services/project-academic-knowledge/reference-entity-attributes
#' for details.
#' @param model (character) Name of the model that you wish to query. One 
#' of 'latest' or 'beta-2015'. Default: latest
#' @param key (character) microsoft academic API key, see the `Authentication` 
#' section in [microdemic-package]
#' @param ... curl options passed on to [crul::HttpClient]
#' @return a list of length two, with `expr` (character) and
#' `entities` (data.frame)
#' @references Query expression syntax
#' https://docs.microsoft.com/en-us/academic-services/project-academic-knowledge/reference-query-expression-syntax
#' @examples \dontrun{
#' # any numeric value that starts with 19
#' ma_evaluate(query = "Y='19'...")
#' # author name matching, and request certain fields back
#' ma_evaluate(query = "Composite(AA.AuN=='smith')",
#'   atts = c('Id', 'AA.AuN'))
#' # matching year 2010 and request Id and Y fields
#' ma_evaluate(query = "Y=2010", atts = c('Id', 'Y'))
#' # range of years: includes only left boundary value: 2010, 2012
#' ma_evaluate(query = "Y=[2010, 2012)", atts = c('Id', 'Y'))
#' # range by specific dates
#' ma_evaluate(query = "D=['2010-02-03','2010-02-05']", atts = c('Id', 'Y'))
#' # matching author and matching affiliation
#' x <- "Composite(And(AA.AuN='mike smith',AA.AfN='harvard university'))"
#' ma_evaluate(x)
#' }
ma_evaluate <- function(query, count = 10, offset = 0, orderby = NULL,
  atts = c("Id", "AA.AuN", "J.JN", "Ti", "Y", "CC"), model = "latest", 
  key = NULL, ...) {

  assert(model, "character")
  if (!model %in% c('latest', 'beta-2015')) {
    stop("model must be one or 'latest' or 'beta-2015'")
  }
  if (!is.null(atts)) atts <- paste0(atts, collapse = ",")
  args <- comp(list(expr = query, count = count, offset = offset,
    orderby = orderby, attributes = atts, model = model))
  tibble::as_tibble(
    ma_HTTP("academic/v1.0/evaluate", args, key, ...)$entities
  )
}
