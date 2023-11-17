test_that("dataset is correctly predicted", {
  set.seed(0)
  data <- data.frame(feature1 = runif(10),feature2 = runif(10),target = sample(c("A", "B"), 10, replace = TRUE))
  tree <- myrpart(data, "target", max_depth = 3)
  expect_equal(predict_dataset(tree, data),as.vector(as.matrix(data['target'])))
})
