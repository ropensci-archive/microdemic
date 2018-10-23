context("ma_calchist")

# test_that("ma_calchist works as expected", {
#   skip_on_cran()
#   ## FIXME: add vcr back later, rate limit exceeded on this, must have changed to be very very few per time period
#   vcr::use_cassette("ma_calchist", {
#     aa <- ma_calchist(query = "And(Composite(AA.AuN=='jaime teevan'),Y>2012)",
#        atts = c('Y', 'F.FN'))

#     expect_is(aa, "list")
#     expect_named(aa, c('expr', 'num_entities', 'histograms'))
#     expect_is(aa$histograms$histogram[[1]], "data.frame")
#     expect_is(aa$histograms$histogram[[2]], "data.frame")
#     expect_named(aa$histograms$histogram[[2]], c('value', 'logprob', 'count'))
#   })
# })
