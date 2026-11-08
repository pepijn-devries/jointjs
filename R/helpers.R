.generate_hex_id <- function(len = 16) {
  hex_digits <- c(0:9, letters[1:6])
  paste(sample(hex_digits, len, replace = TRUE), collapse = "")
}
