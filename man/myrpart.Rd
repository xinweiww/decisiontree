% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/myrpart.R
\name{myrpart}
\alias{myrpart}
\title{my rpart function}
\usage{
myrpart(data, target_col, depth = 0, max_depth)
}
\arguments{
\item{data}{the dataset used to train the decision tree}

\item{target_col}{target feature}

\item{depth}{the current depth, used for stopping criteria}

\item{max_depth}{the maximum depth which stops the growth of the tree}
}
\description{
Used to mimic the original r function rpart(), the node structure of decision tree
generate the whole decision tree iteratively
}
\examples{
data <- data.frame(feature1 = runif(10),feature2 = runif(10),target = sample(c("A", "B"), 10, replace = TRUE))
myrpart(data, "target", max_depth = 3)
}
