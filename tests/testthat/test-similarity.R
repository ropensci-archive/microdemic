context("ma_similarity")

test_that("ma_similarity works as expected", {
  skip_on_cran()

  s1 <- "Using complementary priors, we derive a fast greedy algorithm that
	can learn deep directed belief networks one layer at a time, provided the
	top two layers form an undirected associative memory"

	s2 <- "Deepneural nets with a large number of parameters are very powerful
	machine learning systems. However, overfitting is a serious problem in
	such networks"

  vcr::use_cassette("ma_similarity", {
  	aa <- ma_similarity(s1, s2)
    expect_type(aa, "double")
  }, preserve_exact_body_bytes = TRUE)
})
