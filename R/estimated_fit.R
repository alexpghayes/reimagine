
new_fit <- function(fit_object, specification, implementation) {

  estimated_fit <- list(
    specification = specification,
    implementation = implementation,
    fit_object = fit_object
  )

  class(estimated_fit) <- "estimated_fit"
  estimated_fit
}

print.estimated_fit <- function(object) {
  cat("Estimated Fit\n")
  cat("---------------\n\n")
  print(object$specification$model_group)
  print(object$specification$model)
  print(object$specification$estimator)
  cat("Implementation:", object$implementation, "\n")
  print(object$fit_object)
}
