test_that("information_entropy works", {
  expect_equal(information_entropy(c("cat", "dog", "cat", "dog", "dog", "bird")), 1.4591479170272448)
  expect_equal(information_entropy(c("A", "B", "A", "A", "B", "B", "A", "B")), 1.0)
})

