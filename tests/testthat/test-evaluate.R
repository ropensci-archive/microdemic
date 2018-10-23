context("ma_evaluate")

test_that("ma_evaluate works as expected", {
  skip_on_cran()

  vcr::use_cassette("ma_evaluate", {
    aa <- ma_evaluate(query = "Y='19'...")

    expect_is(aa, "tbl_df")
    expect_named(aa, c('logprob', 'Id', 'Ti', 'Y', 'CC', 'AA', 'E', 'J.JN'))

    expect_type(aa$logprob, "double")
    expect_type(aa$Id, "double")
    expect_type(aa$E, "character")
  }, preserve_exact_body_bytes = TRUE)
})
