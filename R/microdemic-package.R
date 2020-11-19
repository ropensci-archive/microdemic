#' @title microdemic
#' @description Microsoft Academic Client
#' @section Links:
#'
#' * web interface: https://academic.microsoft.com/
#' * API docs:
#' - https://docs.microsoft.com/en-us/academic-services/project-academic-knowledge/introduction
#'
#' @section Package API:
#'
#' * [ma_search()]
#' * [ma_calchist()]
#' * [ma_evaluate()]
#' * [ma_interpret()]
#' * [ma_abstract()]
#'
#' @section Authentication:
#' See Microsoft Academic docs link above  to get
#' an API key. Make sure you enable Academic Knowledge. They should 
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
#' @author Scott Chamberlain
#' @keywords package
NULL
