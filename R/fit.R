
new_fit <- function(fit_object, specification, implementation) {

  object <- list(
    specification = specification,
    implementation = implementation,
    fit = fit_object
  )

  # TODO: figure out how to subclass on estimator and/or implementation

  class(object) <- "estimated_fit"
  object
}

print.estimated_fit <- function(object) {
  cat("Estimated Fit\n")
  cat("---------------\n\n")
  print(object$specification$model_group)
  print(object$specification$model)
  print(object$specification$estimator)
  cat("Implementation:", object$implementation, "\n")
  print(object$fit)
}
