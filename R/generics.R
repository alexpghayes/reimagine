fit <- function(specification, formula, data, ...) {
  UseMethod("fit")
}

validate_estimator <- function(estimator) {
  UseMethod("validate_estimator")
}

# coef

# predict

# interpret coefficients

translate <- function(specification, implementation, others) {
  UseMethod("translate")
}
