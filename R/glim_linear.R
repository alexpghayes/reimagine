new_linear <- function(
  coefs = c(
    "mle",
    "lasso",
    "group_lasso",
    "ridge",
    "gee"
  ),
  covariance = c(
    "mle",
    "HC1",
    "HC2",
    "gee1",
    "gee2",
    "none"
  ),
  sigma = c(
    "in_sample",
    "cv",
    "bootstrap"
  )) {

  coefs <- match.arg(coefs)
  covariance <- match.arg(covariance)
  sigma <- match.arg(sigma)

  estimator <- new_estimator(
    coefs = coefs,
    covariance = covariance,
    sigma = sigma
  )

  # validate_glim_linear_estimators(estimator)

  object <- new_glim()
  object$model <- new_model("linear")
  object$estimator <- estimator
  object
}

fit_glim_linear <- function(object, data, ...) {
  UseMethod("fit_glim_linear")
}

fit_glim.linear <- function(model, object, data, implementation = NULL) {

  if (object$estimator$estimands$coefs == "mle")
    estimated_fit <- fit_glim_linear_mle(object, data, implementation)
  else if (object$estimator$estimands$coefs == "lasso")
    estimated_fit <- fit_glim_linear_lasso(object, data, implementation)
  else
    stop("No available implementation for the provided specification.")

  estimated_fit
}

fit_glim_linear_mle <- function(object, data, implementation) {

  # parsnip's translation step should probably work on specifications
  # and return model calls
  # call <- translate(specification, implementation)

  # for now assume data is always mtcars
  fit_object <- lm(hp ~ ., mtcars)

  estimated_fit <- new_fit(
    fit_object = fit_object,
    specification = object,  # TODO: clarify that this is the specification
    implementation = "stats::lm()"
  )

  estimated_fit
}

fit_glim_linear_lasso <- function(object, data, implementation) {

  # parsnip's translation step should probably work on specifications
  # and return model calls
  # call <- translate(specification, implementation)

  requireNamespace("glmnet", quietly = TRUE)

  # for now assume data is always mtcars
  formula <- hp ~ .
  x <- model.matrix(formula, data)
  y <- model.response(model.frame(formula, data))
  fit_object <- glmnet::cv.glmnet(x, y)

  estimated_fit <- new_fit(
    fit_object = fit_object,
    specification = object,
    implementation = "glmnet::cv.glmnet()"
  )

  estimated_fit
}

