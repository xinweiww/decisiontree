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
#' calculate_info_gain(data, left_data, right_data, target_col)
calculate_info_gain <- function(data, left_data, right_data, target_col) {

  entropy_before_split <- information_entropy(data[[target_col]])
  entropy_after_split <- (
    nrow(left_data) / nrow(data)) * information_entropy(left_data[[target_col]]) +
    (nrow(right_data) / nrow(data)) * information_entropy(right_data[[target_col]])

  return (entropy_before_split - entropy_after_split)

}
