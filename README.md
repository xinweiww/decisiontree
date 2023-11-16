
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Overview

<!-- badges: start -->
<!-- badges: end -->

The goal of decisiontree is to predict the class of an input data point
or dataset with trained decision tree, consisting of six functions:

- `information_entropy()` defines the information entropy given a list
  of labels/classe
- `calculate_infor_gain()` calculates the information gain after
  splitting a node
- `find_best_split()` finds the best split method to achieve maximum
  information gain
- `myrpart()` builds the structure of the decision tree
- `predict_point()` predicts the label given a data point
- `predict_dataset()` generalizes the prediction to dataset level.

## Installation

You can install the development version of decisiontree from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("xinweiww/decisiontree")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(decisiontree)

set.seed(1)
data <- data.frame(
  feature1 = runif(100),
  feature2 = runif(100),
  target = sample(c("A", "B"), 100, replace = TRUE)
)


train_indices <- sample(1:nrow(data), 0.8 * nrow(data))
train <- data[train_indices, ]
test <- data[-train_indices, ]


model <- myrpart(train, "target", max_depth = 5)

cat('the predicted labels are ',predict_dataset(model,test),'\n')
#> the predicted labels are  B A A A A B B A B A B A B B A A B A A B
cat('the actual labels are ',test$target,'\n')
#> the actual labels are  A B B B B B B A B A A A B B A A B A B A
cat('the model accuracy is ',sum(predict_dataset(model,test) == test$target) / nrow(test))
#> the model accuracy is  0.6
```

From the above output, we can see that 12 cases are predicted right out
of 20, which gives us a prediction accuracy of 0.6.

However, we only used two input features and a target feature of two
different classes. Decision tree has always been suffering from
overfitting which means the test accuracy could be lower when we try to
predict a new dataset.

``` r
set.seed(1)
data <- data.frame(
  feature1 = runif(100),
  feature2 = runif(100),
  feature3 = runif(100),
  feature4 = runif(100),
  feature5 = runif(100),
  target = sample(c("A", "B","C","D"), 100, replace = TRUE)
)


train_indices <- sample(1:nrow(data), 0.8 * nrow(data))
train <- data[train_indices, ]
test <- data[-train_indices, ]


model <- myrpart(train, "target", max_depth = 5)

cat('the predicted labels are ',predict_dataset(model,test),'\n')
#> the predicted labels are  B C B C D B A C C C C B D A B A A A A A
cat('the actual labels are ',test$target,'\n')
#> the actual labels are  C D D C B A B D D C A A B D A D A C D A
cat('the model accuracy is ',sum(predict_dataset(model,test) == test$target) / nrow(test))
#> the model accuracy is  0.2
```

Now we can see that the test accuracy is only 0.2. Altough the
stimulated data is generated using runif(), I would not recommend using
decisiontree package for complicated dataset.
