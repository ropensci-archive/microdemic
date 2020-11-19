context("ma_search")

test_that("ma_search works as expected", {
  skip_on_cran()

  vcr::use_cassette("ma_search", {
    aa <- ma_search(query = "Y='19'...")

    expect_is(aa, "tbl_df")
    expect_type(aa$logprob, "double")
    expect_type(aa$Id, "double")
    expect_type(aa$AA, "list")
    expect_is(aa$AA[[1]], "data.frame")
    expect_named(aa$AA[[1]], "AuN")
  }, preserve_exact_body_bytes = TRUE)
})
