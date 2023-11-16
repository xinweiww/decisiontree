#' Predict a point
#'
#' Make a prediction of a new data point along the decision tree
#'
#' @param tree the trained decision tree
#' @param data_point a given new data point
#'
#' @return
#' @export
#'
#' @examples
#' data <- data.frame(feature1 = runif(10),feature2 = runif(10),target = sample(c("A", "B"), 10, replace = TRUE))
#' tree <- myrpart(data, "target", max_depth = 3)
#' predict_point(tree, data[1, ])
predict_point <- function(tree, data_point) {
  # return the node if it is leaf node
  if (tree$leaf) {
    return(tree$class)
  } else {
    # running down the decision tree and decide on the direction using split threshold
    if (data_point[[tree$split_col]] <= tree$split_value) {
      return(predict_point(tree$left, data_point))
    } else {
      return(predict_point(tree$right, data_point))
    }
  }
}
