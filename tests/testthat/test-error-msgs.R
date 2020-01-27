context("ma_error")

test_that("Detailed error messages are provided when possible", {
  skip_on_cran()

  vcr::use_cassette("ma_error", {
    # error: Query parsing error in string "hi-there" at position 2: Unknown
    # function/attribute 'hi'
    expect_error(ma_search("hi-there"))
    # error: Offset must be an integer
    expect_error(ma_evaluate("Y=[2010, 2012)", offset = "bad-offset"))
    # error: Access denied due to invalid subscription key. Make sure you
    # are subscribed to an API you are trying to call and provide the right
    # key.
    expect_error(ma_search("Y=[2010, 2012)", key = "bad-key"))
  }, preserve_exact_body_bytes = TRUE)
})
