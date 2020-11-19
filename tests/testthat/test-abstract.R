context("ma_abstract")

test_that("ma_abstract works as expected", {
  skip_on_cran()

  vcr::use_cassette("ma_abstract", {
    aa <- ma_abstract(query = "Y='19'...", count = 10)

    expect_is(aa, "tbl_df")
    expect_is(aa$Id, "numeric")
    expect_is(aa$abstract, "character")
    expect_equal(NROW(aa), 9)
  }, preserve_exact_body_bytes = TRUE)

  vcr::use_cassette("ma_abstract_no_NAs", {
    res <- ma_abstract("Id=2142076420")
    expect_false(grepl("\\bNA\\b", res$abstract))
  }, preserve_exact_body_bytes = TRUE)

})
