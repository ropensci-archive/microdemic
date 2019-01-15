context("ma_error")

test_that("Detailed error messages are provided when possible", {
  skip_on_cran()

  vcr::use_cassette("ma_error", {
    expect_error(
      ma_search(query = "hi-there"),
      "query"
    )
  }, preserve_exact_body_bytes = TRUE)
})
