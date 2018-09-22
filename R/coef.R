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
# why would you not want to just jump immediately to
# coef(estimated_fit$fit_object)
#
# the answer: if you jump straight to predict(estimated_fit$fit_object)
# all of a sudden you have to deal with predictions from 8 types of models
# all at once
#
# on the prediction side of things, safe_predict will deal with this so it's
# a moot point
#
# what about on the model interpretation side of things, or the model
# reporting side? think glmnet when you want to create a LaTeX report
# describing the loss function being minimized but now you have to search
# through by family and see where everything actually is
#
# the idea is to provide some additional guarantees about what's actually
# been fit, so you know it's reasonable to provide a method for that estimator

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
