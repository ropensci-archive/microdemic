context("ma_evaluate")

test_that("ma_evaluate works as expected", {
  skip_on_cran()
  Sys.sleep(1)

  aa <- ma_evaluate(query = "Ti='biology'...")

  expect_is(aa, "tbl_df")
  expect_named(aa, c('logprob', 'Id', 'E', 'Ti', 'Y', 'CC', 'AA', 'J.JN'))

  expect_type(aa$logprob, "double")
  expect_type(aa$Id, "integer")
  expect_type(aa$E, "character")
})
