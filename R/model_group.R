new_model_group <- function(group_name) {
  stopifnot(is.character(group_name))
  class(group_name) <- c(group_name, "model_group")
  group_name
}

print.model_group <- function(object) {
  cat("Model group:", unclass(object), "\n")
}
