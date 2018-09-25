create_arg_list <- function(..., others) c(list(...), others)

add_arg <- function(arg_list, ...) c(arg_list, list(...))
