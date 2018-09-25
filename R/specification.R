new_specification <- function(model_group, model, estimator) {
  specification <- list(
    model_group = model_group,
    model = model,
    estimator = estimator
  )
  class(specification) <- c(
    paste(model_group, model, estimator, sep = "_"),
    "specification"
  )
  specification
}

print.specification <- function(specification) {
  cat("Model-estimator specification\n")
  cat("------------------------------\n\n")
  cat("Model group: ", specification$model_group, "\n")
  cat("Model:       ", specification$model, "\n")
  cat("Estimator(s):", specification$estimator, "\n")
}
