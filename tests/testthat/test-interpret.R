context("ma_interpret")

test_that("ma_interpret works as expected", {
  skip_on_cran()
  Sys.sleep(1)

  aa <- ma_interpret(query = "papers by jaime'...")

  expect_is(aa, "list")
  expect_is(aa$query, "character")
  expect_is(aa$interpretations, "data.frame")
  expect_named(aa$interpretations, c('logprob', 'parse', 'rules'))
})
