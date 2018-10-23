context("ma_search")

test_that("ma_search works as expected", {
  skip_on_cran()

  vcr::use_cassette("ma_search", {
    aa <- ma_search(query = "Y='19'...")

    expect_is(aa, "tbl_df")
    expect_named(aa, c('logprob', 'Id', 'Ti', 'Y', 'CC', 'AA', 'J.JN',
                       'DN', 'VFN', 'DOI'))

    expect_type(aa$logprob, "double")
    expect_type(aa$Id, "double")
    expect_type(aa$VFN, "character")
  }, preserve_exact_body_bytes = TRUE)
})
