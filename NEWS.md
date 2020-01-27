microdemic 0.5.0
================

### NEW FEATURES

* new author Christopher Baker (#13)
* docs website at https://docs.ropensci.org/microdemic

### MINOR IMPROVEMENTS

* all functions now pass along detailed error messages; before we were erroring but just giving the http status code and generic message; as part of this fix now importing httpcode pkg (#7) (#12) (#14)
* use fake API key on travis to avoid test suite error (#11)
* internals of `ma_search()` have changed a bit; get in touch if you have any questions about this function

### BUG FIXES

* fix to internal function `invabs2abs()` within `ma_abstract()`: the inverted index returned from Microsoft can have missing values and we were incorrectly inserting NA's into those spots resulting in NA's in abstracts (#8) (#9)

microdemic 0.4.0
================

### MINOR IMPROVEMENTS

* do testing with `vcr` (#5) (#6)
* make the output of `ma_abstract()` a data.frame and add `Id` column to 
facilitate matching to other data (#4)

microdemic 0.3.0
================

### MINOR IMPROVEMENTS

* Improve docs on how to use and get API keys (#3)
* Change base URL from `westus.api.cognitive.microsoft.com` to `api.labs.cognitive.microsoft.com`. Because of this change, you need to get use an API key from a the microsoft labs website. Get a key at <https://labs.cognitive.microsoft.com/en-us/subscriptions> and see `?microdemic-package` for details on how to use it (#2)


microdemic 0.2.0
================

### NEW FEATURES

* Many of the functions gain a new parameter `model` with value of 
'latest' or 'beta-2015'. 


microdemic 0.1.0
================

### NEW FEATURES

* released to CRAN
