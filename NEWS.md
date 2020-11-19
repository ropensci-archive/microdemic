microdemic 0.6.0
================

### NEW FEATURES

* The `E` attribute we used heavily for data for various functions here has been dropped and its sub fields brought to the top level. Just internal changes - except for that the default fields in `ma_calchist`, `ma_evaluate`, and `ma_search` now do not include `E`. See the github issue for link for details  (#17)

### DEFUNCT

* `ma_similarity()` is now defunct as the service at least appears to be gone or down often enough its not worth supporting (#16)
* `ma_graph_search()` is now defunct as the service at least appears to be gone or down often enough its not worth supporting (#18)

microdemic 0.5.0
================

### NEW FEATURES

* new author Christopher Baker (#13)
* docs website added

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
* Change base URL from `westus.api.cognitive.microsoft.com` to `api.labs.cognitive.microsoft.com`. Because of this change, you need to get use an API key from a the microsoft labs website. Get a key at some url and see `?microdemic-package` for details on how to use it (#2)


microdemic 0.2.0
================

### NEW FEATURES

* Many of the functions gain a new parameter `model` with value of 
'latest' or 'beta-2015'. 


microdemic 0.1.0
================

### NEW FEATURES

* released to CRAN
