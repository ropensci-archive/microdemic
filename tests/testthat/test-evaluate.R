context("ma_evaluate")

test_that("ma_evaluate works as expected", {
  skip_on_cran()

  vcr::use_cassette("ma_evaluate", {
    aa <- ma_evaluate(query = "Y='19'...")

    expect_is(aa, "tbl_df")
    expect_type(aa$logprob, "double")
    expect_type(aa$Id, "double")
    expect_type(aa$Ti, "character")
  }, preserve_exact_body_bytes = TRUE)
})
