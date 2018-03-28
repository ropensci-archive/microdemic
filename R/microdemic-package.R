#' Microsoft Academic Client
#'
#' @section Links:
#'
#' * web interface: <https://academic.microsoft.com/>
#' * API docs: <https://dev.labs.cognitive.microsoft.com/docs/services/56332331778daf02acc0a50b/operations/565d9001ca73072048922d97>
#'
#' @section Package API:
#'
#' * [ma_search()]
#' * [ma_calchist()]
#' * [ma_evaluate()]
#' * [ma_interpret()]
#' * [ma_similarity()]
#' * [ma_abstract()]
#' * [ma_graph_search()]
#'
#' @section Authentication:
#' See <https://labs.cognitive.microsoft.com/en-us/subscriptions> to get
#' an API key. Make sure you enable Academic Knowledge and. They should 
#' give you two API keys - use either one. You can always pass your API 
#' key as a parameter to functions in `microdemic`, but we strongly 
#' encourage you to set an environment variable, named `MICROSOFT_ACADEMIC_KEY`
#' 
#' To set the environment variable for the current R session only, 
#' run `Sys.setenv(MICROSOFT_ACADEMIC_KEY = "yourkey")`. Then `microdemic`
#' will pick up this key and you do not have to pass your key as a 
#' parameter to the functions.
#' 
#' Even better, save your environment variable in the file that R will use 
#' to read in environment variables like `MICROSOFT_ACADEMIC_KEY=yourkey`. 
#' This may vary by system and machine. 
#' See `?Startup` for details. It's likely your `.Renviron` file that 
#' is stored in your home directory. Or could be another environment 
#' variable holding file like `.zshrc` or `.bash_profile`. After saving the
#' file, make sure to quit R, source that file like `source .Renviron`, 
#' then start R again. Or restart your RStudio session or similar for 
#' other R scenarios.
#' 
#'
#' @section Rate limits:
#'
#' * 10,000 transactions per day
#' * 3 per second for interpret
#' * 1 per second for evaluate
#' * 6 per minute for calcHistogram
#'
#' @name microdemic-package
#' @aliases microdemic
#' @docType package
#' @author Scott Chamberlain \email{myrmecocystus@@gmail.com}
#' @keywords package
NULL
