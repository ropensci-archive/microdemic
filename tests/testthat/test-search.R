context("ma_search")

test_that("ma_search works as expected", {
  skip_on_cran()
  Sys.sleep(1)

  aa <- ma_search(query = "Ti='biology'...")

  expect_is(aa, "tbl_df")
  expect_named(aa, c('logprob', 'Id', 'Ti', 'Y', 'CC', 'AA', 'J.JN',
                     'DN', 'VFN', 'DOI'))

  expect_type(aa$logprob, "double")
  expect_type(aa$Id, "integer")
  expect_type(aa$VFN, "character")
})
