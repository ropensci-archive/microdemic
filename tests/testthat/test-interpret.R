context("ma_interpret")

test_that("ma_interpret works as expected", {
  skip_on_cran()
  
  vcr::use_cassette("ma_interpret", {
    aa <- ma_interpret(query = "papers by jaime'...")

    expect_is(aa, "list")
    expect_is(aa$query, "character")
    expect_is(aa$interpretations, "data.frame")
    expect_named(aa$interpretations, c('logprob', 'parse', 'rules'))
  }, preserve_exact_body_bytes = TRUE)
})
