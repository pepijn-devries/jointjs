.generate_hex_id <- function(len = 16) {
  hex_digits <- c(0:9, letters[1:6])
  paste(sample(hex_digits, len, replace = TRUE), collapse = "")
}

.capture_r6_inputs <- function() {
  parent_env <- sys.frame(-1)
  
  calling_fun <- sys.function(-1)
  
  non_missing <- names(formals(calling_fun))
  non_missing <- non_missing[!non_missing %in% c("...", "self", "private")]
  
  captured <- Filter(
    function(x) !rlang::is_missing(x),
    mget(non_missing, envir = parent_env, inherits = FALSE)
  )
  
  dots <- eval(quote(list(...)), envir = parent_env)
  c(captured, dots)
}