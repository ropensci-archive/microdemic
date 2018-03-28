comp <- function(x) Filter(Negate(is.null), x)

ma_base <- function() "https://api.labs.cognitive.microsoft.com"

ma_HTTP <- function(path, args, key, method = "GET", body = list(),
                    encode = "form", ctype = NULL, ...) {
  key <- check_key(key)
  cli <- crul::HttpClient$new(
    url = ma_base(),
    headers = list(
      `Ocp-Apim-Subscription-Key` = key
    )
  )
  if (!is.null(ctype)) cli$headers <- c(cli$headers, `Content-Type` = ctype)
  res <- switch(
    method,
    GET = cli$get(path, query = args, ...),
    POST = cli$post(path, query = args, body = body, encode = encode, ...)
  )
  res$raise_for_status()
  txt <- res$parse("UTF-8")
  jsonlite::fromJSON(txt, flatten = TRUE)
}

check_key <- function(x) {
  if (!is.null(x)) {
    return(x)
  } else {
    x <- Sys.getenv("MICROSOFT_ACADEMIC_KEY", "")
    if (nchar(x) == 0) {
      stop("API key needed for Microsoft Academic, see ?microdemic-package")
    } else {
      return(x)
    }
  }
}

dfrbl <- function(x) {
  (xxxxx <- data.table::setDF(
    data.table::rbindlist(x, use.names = TRUE, fill = TRUE)
  ))
}

assert <- function(x, y) {
  if (!is.null(x)) {
    if (!class(x) %in% y) {
      stop(deparse(substitute(x)), " must be of class ",
           paste0(y, collapse = ", "), call. = FALSE)
    }
  }
}
