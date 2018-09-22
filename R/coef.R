mle_fit <- new_linear() %>%
  fit(mtcars, NULL)

lasso_fit <- new_linear(coefs = "lasso") %>%
  fit(mtcars, NULL)

mle_fit
lasso_fit

class(mle_fit)
class(lasso_fit)

# show why this is useful with a vcov descent tree

coef.estimated_fit <- function(estimated_fit) {
  coef(object$specification$model_group, estimated_fit)
}

## why is this descent tree useful?

coef.glim <- function(model_group, estimated_fit) {
  coef_glim(estimated_fit$specification$model)
}

coef_glim <- function(model, estimated_fit) {
  UseMethod("coef_glim")
}

coef_glim.linear <- function(model, estimated_fit) {
  coef(estimated_fit$fit_object)
}

## other methods to implement:
#  - interpret coef
#  - predict
#  - vcov
