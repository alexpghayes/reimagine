new_estimator <- function(...) {
  estimator <- list()
  estimands <- list(...)
  estimator$specified <- length(estimands) > 0
  estimator$estimands <- estimands
  class(estimator) <- "estimator"
  estimator
}

print.estimator <- function(object) {
  if (!object$specified)
    cat("Estimator(s): Unspecified\n")
  else {
    cat("Estimator(s):\n")
    for (estimand in names(object$estimands))
      cat("  ", estimand, ": ", object$estimands[[estimand]], "\n", sep = "")
  }
  invisible(object)
}

validate_estimator <- function(estimator) {
  UseMethod("validate_estimator")
}
