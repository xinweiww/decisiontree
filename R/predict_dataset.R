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
#' data <- data.frame(feature1 = runif(10),feature2 = runif(10),target = sample(c("A", "B"), 10, replace = TRUE))
#' tree <- myrpart(data, "target", max_depth = 3)
#' predict_dataset(tree, data)
predict_dataset <- function(tree, dataset) {
  predictions <- sapply(1:nrow(dataset), function(i) predict_point(tree, dataset[i, ]))
  return(predictions)
}
