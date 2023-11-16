#' Predict a dataset
#'
#' Generalize the predict_point to a new dataset
#'
#' @param tree the trained decision tree
#' @param dataset the new dataset
#'
#' @return
#' @export
#'
#' @examples
#' predict_dataset(tree_model, test_data)
predict_dataset <- function(tree, dataset) {
  predictions <- sapply(1:nrow(dataset), function(i) predict_point(tree, dataset[i, ]))
  return(predictions)
}
