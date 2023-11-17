test_that("find the right split", {
  set.seed(0)
  data <- data.frame(feature1 = runif(10),feature2 = runif(10),target = sample(c("A", "B"), 10, replace = TRUE))
  expect_equal(find_best_split(data, 'target'), "feature1")
})
