context("ma_evaluate")

test_that("ma_evaluate works as expected", {
  skip_on_cran()
  Sys.sleep(1)

  aa <- ma_abstract(query = "Ti='biology'...", count = 10)

  expect_is(aa, "character")
  expect_equal(length(aa), 10)
})
