#' Calculate information gain
#'
#' Used to calculate the information gain after splitting a node into left part and right part, the standard
#' for splitting a node
#'
#' @param data the original data
#' @param left_data the left part after splitting
#' @param right_data the right part after splitting
#' @param target_col the target feature
#'
#' @return
#' @export
#'
#' @examples
#' data <- data.frame(feature1 = runif(10),feature2 = runif(10),target = sample(c("A", "B"), 10, replace = TRUE))
#' split_value <- median(data$feature1)
#' left_data <- data[data$feature1 <= split_value, ]
#' right_data <- data[data$feature1 > split_value, ]
#' calculate_info_gain(data, left_data, right_data, 'target')
calculate_info_gain <- function(data, left_data, right_data, target_col) {

  entropy_before_split <- information_entropy(data[[target_col]])
  entropy_after_split <- (
    nrow(left_data) / nrow(data)) * information_entropy(left_data[[target_col]]) +
    (nrow(right_data) / nrow(data)) * information_entropy(right_data[[target_col]])

  return (entropy_before_split - entropy_after_split)

}


