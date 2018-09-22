new_model <- function(model_name) {
  stopifnot(is.character(model_name))
  class(model_name) <- c(model_name, "model")
  model_name
}

print.model <- function(object) {
  cat("Model:", unclass(object), "\n")
}
