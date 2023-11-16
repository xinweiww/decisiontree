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
#' predict_point(tree, dataset[i, ])
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
