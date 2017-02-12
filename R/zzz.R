comp <- function(x) Filter(Negate(is.null), x)

ma_base <- function() "https://westus.api.cognitive.microsoft.com/academic/v1.0"

ma_GET <- function(path, args, key, ...) {
  head <- httr::add_headers(
    `Ocp-Apim-Subscription-Key` = key
  )
  res <- httr::GET(file.path(ma_base(), path), query = args, head, ...)
  httr::stop_for_status(res)
  txt <- httr::content(res, "text", encoding = "UTF-8")
  jsonlite::fromJSON(txt)
}
