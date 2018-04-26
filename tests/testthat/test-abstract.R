context("ma_abstract")

test_that("ma_abstract works as expected", {
  vcr::use_cassette("ma_abstract", {
    aa <- ma_abstract(query = "Y='19'...", count = 10)

    expect_is(aa, "character")
    expect_equal(length(aa), 10)
  })
})
