new_glim <- function() {
  object <- new_specification()
  object$model_group <- new_model_group("glim")
  object
}

fit_glim <- function(object, data, ...) {
  UseMethod("fit_glim")
}

fit.glim <- function(model_group, object, data, implementation = NULL) {
  fit_glim(object$model, object, data, implementation)
}

validate_estimator_glim <- function(estimator) {
  UseMethod("validate_estimator_glim")
}

validate_estimator.glim <- function(estimator) {
  validate_estimator_glim(estimator)
}
