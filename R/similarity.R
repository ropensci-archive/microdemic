#' Similarity API
#'
#' @export
#' @param s1,s2 (character) strings 1 and 2. required
#' @param method (character) one of GET (default) or POST
#' @param model (character) Name of the model that you wish to query. One of
#' 'latest' or 'beta-2015'. Default: latest
#' @param key (character) microsoft academic API key, see the `Authentication`
#' section in [microdemic-package]
#' @param ... curl options passed on to [crul::HttpClient]
#' @return a single value representing the cosine similarity of the text inputs 
#' of s1 and s2. The output is represented by a floating point between -1.0 
#' and +1.0. The similarity API evaluates the strings base on their academic 
#' concepts, with +1.0 being the most similar and -1.0 being the least similar.
#' @examples \dontrun{
#' s1 <- "Using complementary priors, we derive a fast greedy algorithm that
#' can learn deep directed belief networks one layer at a time, provided the
#' top two layers form an undirected associative memory"
#'
#' s2 <- "Deepneural nets with a large number of parameters are very powerful
#' machine learning systems. However, overfitting is a serious problem in
#' such networks"
#'
#' ma_similarity(s1, s2)
#'
#' ma_similarity(s1, s2, method = "POST")
#' }
ma_similarity <- function(s1, s2, method = "GET", model = "latest", 
  key = NULL, ...) {

  if (!method %in% c("GET", "POST")) stop("'method' must be one of GET or POST")
  
  # assert(model, "character")
  # if (!model %in% c('latest', 'beta-2015')) {
  #   stop("model must be one or 'latest' or 'beta-2015'")
  # }

  if (method == "GET") {
    args <- comp(list(s1 = s1, s2 = s2, model = model))
    ma_HTTP("academic/v1.0/similarity", args, key, ...)
  } else {
    args <- comp(list(model = model))
    body <- sprintf("s1=%s&s2=%s", s1, s2)
    ma_HTTP("academic/v1.0/similarity", NULL, key = key,
            method = 'POST', args = args, body = body, ...)
  }
}
