# set up vcr
library("vcr")
invisible(vcr::vcr_configure(
    dir = "../fixtures/vcr_cassettes",
    filter_sensitive_data = list("<<<microdemic_api_key>>>" = Sys.getenv('MICROSOFT_ACADEMIC_KEY'))
))
