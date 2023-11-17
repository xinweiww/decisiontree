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
#' data <- data.frame(feature1 = runif(10),feature2 = runif(10),target = sample(c("A", "B"), 10, replace = TRUE))
#' find_best_split(data, 'target')
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

      if (nrow(left_data) == 0 || nrow(right_data) == 0) {
        next #skip empty datasets
      }

      info_gain <- calculate_info_gain(data, left_data, right_data, target_col)

      #if (is.na(info_gain) || is.nan(info_gain)) {
       # next #avoid Na or NaN
      #}

      if (info_gain > best_info_gain) {
        best_info_gain <- info_gain
        best_split <- feature
      }
    }
  }

  return(best_split)

}
