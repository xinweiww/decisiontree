test_that("model is created", {
  data <- data.frame(feature1 = runif(10),feature2 = runif(10),target = sample(c("A", "B"), 10, replace = TRUE))
  model <- myrpart(data, "target", max_depth = 3)
  expect_true(exists("model"))
})
