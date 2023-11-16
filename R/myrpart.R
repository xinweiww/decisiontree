#' my rpart function
#'
#' Used to mimic the original r function rpart(), the node structure of decision tree
#' generate the whole decision tree iteratively
#'
#' @param data  the dataset used to train the decision tree
#' @param target_col target feature
#' @param depth the current depth, used for stopping criteria
#' @param max_depth the maximum depth which stops the growth of the tree
#'
#' @return
#' @export
#'
#' @examples
#' data <- data.frame(feature1 = runif(10),feature2 = runif(10),target = sample(c("A", "B"), 10, replace = TRUE))
#' myrpart(data, "target", max_depth = 3)
myrpart <- function(data, target_col, depth = 0, max_depth) {

  unique_classes <- unique(data[[target_col]])

  # Two stopping criteria: number of class is 1, max depth is reached
  if (length(unique_classes) == 1 || depth == max_depth ) {

    return(list(class = unique_classes[which.max(table(data[[target_col]]))], leaf = TRUE))

  } else {

    split_col <- find_best_split(data, target_col)
    left_data <- data[data[[split_col]] <= mean(data[[split_col]]), ]
    right_data <- data[data[[split_col]] > mean(data[[split_col]]), ]
    depth <- depth + 1

    return(list(
      split_col = split_col,
      split_value = mean(data[[split_col]]),
      left = myrpart(left_data, target_col, depth, max_depth),
      right = myrpart(right_data, target_col, depth, max_depth),
      leaf = FALSE
    ))
  }
}
