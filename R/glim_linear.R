new_linear <- function(
  estimator = c(
    "mle",
    "lasso",
    "group_lasso",
    "ridge",
    "HC1",
    "HC2",
    "gee",
    "gee_covar_1",
    "gee_covar_2",
    "gee_HC1"
  )) {

  ## open question: how / where should you specify the estimator for sigma
  ## ideally, it should just pop out from one of these things
  ## in practice, you probably need to do something like cross-validation to
  ## get it

  estimator <- match.arg(estimator)

  new_specification(
    model_group = "glim",
    model = "linear",
    estimator = estimator
  )
}

fit.glim_linear_mle <- function(
  specification,
  formula,
  data,
  implementation = c("stats::lm", "mgcv::gam"),
  others) {

  implementation <- match.arg(implementation)

  fit_call <- translate(specification, implementation, others)
  fit_object <- rlang::eval_tidy(fit_call)

  estimated_fit <- new_fit(
    fit_object = fit_object,
    specification = specification,
    implementation = implementation
  )

  estimated_fit
}

translate.glim_linear_mle <- function(specification, implementation, others) {

}



fit.glim_linear_lasso <- function(object, data, implementation) {

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

