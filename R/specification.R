
# class slots:
#  - model
#  - model_group
#  - estimator
#  - fit from estimator


# really what I want:
# first to dispatch implementation, then on estimator, then on model_group, then on model

add_subclass <- function(object, subclass) {
  class(object) <- c(subclass, class(object))
  object
}

set_model_group <- function(object, model_group) {
  object$model_group <- new_model_group(model_group)
  add_subclass(object, paste0("model_group_", model_group))
}

set_model <- function(object, model) {
  object$model <- model
  add_subclass(object, paste0("model_", model))
}

set_estimator <- function(object, estimator) {
  object$estimator <- estimator
  object
}

new_specification <- function() {
  object <- list(
    model_group = NULL,
    model = NULL,
    estimator = NULL,
    implementation = NULL
  )
  class(object) <- "specification"
  object
}

print.specification <- function(object) {
  cat("Model-estimator specification\n")
  cat("------------------------------\n\n")
  print(object$model_group)
  print(object$model)
  print(object$estimator)
}

fit.specification <- function(object, data, implementation) {
  fit(object$model_group, object, data, implementation)
}


