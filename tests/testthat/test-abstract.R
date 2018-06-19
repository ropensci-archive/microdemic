context("ma_abstract")

test_that("ma_evaluate works as expected", {
  skip_on_cran()
  Sys.sleep(1)

  aa <- ma_abstract(query = "Y='19'...", count = 10)

  expect_is(aa, "data.frame")
  expect_named(aa, c('Id', 'abstract'))
  expect_equal(NROW(aa), 10)
})
