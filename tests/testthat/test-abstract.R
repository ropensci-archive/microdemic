context("ma_abstract")

test_that("ma_evaluate works as expected", {
  skip_on_cran()
  Sys.sleep(1)

  aa <- ma_abstract(query = "Y='19'...", count = 10)

  expect_is(aa, "character")
  expect_equal(length(aa), 10)
})
