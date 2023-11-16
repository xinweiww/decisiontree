#' Find the best split
#'
#' Used to find the best split based on the largest information gain
#'
#' @param data the original data
#' @param target_col the target feature/ the splitting attribute
#'
#' @return
#' @export
#'
#' @examples
#' find_best_split(data, target_col)
find_best_split <- function(data, target_col) {
  # obtain all the features names except for the target column feature
  features <- colnames(data)[!colnames(data) %in% target_col]
  # initalize
  best_split <- ''
  best_info_gain <- -1

  # interate every feature in features
  for (feature in features) {
    feature_values <- unique(data[[feature]])

    # Find the best split and return it
    for (value in feature_values) {
      left_data <- data[data[[feature]] <= value, ]
      right_data <- data[data[[feature]] > value, ]

      info_gain <- calculate_info_gain(data, left_data, right_data, target_col)

      if (info_gain > best_info_gain) {
        best_info_gain <- info_gain
        best_split <- feature
      }
    }
  }

  return(best_split)

}
