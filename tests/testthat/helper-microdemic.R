# set up vcr
library("vcr")

# set fake API key on Travis so check_key() doesn't throw an error
if (identical(Sys.getenv("TRAVIS"), "true")) {
  Sys.setenv("MICROSOFT_ACADEMIC_KEY" = "fake_key")
}
invisible(vcr::vcr_configure(
    dir = "../fixtures",
    filter_sensitive_data = list("<<<microdemic_api_key>>>" = Sys.getenv('MICROSOFT_ACADEMIC_KEY'))
))
