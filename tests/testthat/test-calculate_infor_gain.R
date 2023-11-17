test_that("calculate_infor_gain works", {
  set.seed(0)
  data <- data.frame(feature1 = runif(10),feature2 = runif(10),target = sample(c("A", "B"), 10, replace = TRUE))
  split_value <- median(data$feature1)
  left_data <- data[data$feature1 <= split_value, ]
  right_data <- data[data$feature1 > split_value, ]
  expect_equal(calculate_info_gain(data, left_data, right_data, 'target'), 0.1080315461)
})
