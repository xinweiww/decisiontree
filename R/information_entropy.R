#' Information entropy
#'
#' Information entropy is used to quantify the impurity or disorder in a dataset
#'
#' @param labels the target features of the given data
#'
#' @return
#' @export
#'
#' @examples
#' information_entropy(c("cat", "dog", "cat", "dog", "dog", "bird"))
information_entropy <- function(labels) {

  # the definition of information entropy
  entropysum <- 0
  class_probabilities <- table(labels) / length(labels)
  # in order to avoid the situations where class_probabilities equal zero, 1e-10 is added
  entropysum <- sum(class_probabilities * log2(class_probabilities + 1e-10))


  return((-1) * entropysum)

}

