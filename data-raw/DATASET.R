## Get required javascript libraries
lib_dir <- "inst/htmlwidgets/lib"
if (!dir.exists(lib_dir)) dir.create(lib_dir, recursive = TRUE)

dependencies <- list(
  "jquery.js"    = "https://code.jquery.com/jquery-4.0.0.js",
  "lodash.js"    = "https://raw.githubusercontent.com/lodash/lodash/4.18.1-npm/lodash.js",
  "backbone.js"  = "https://backbonejs.org/backbone.js",
  "joint.js"     = "https://cdnjs.cloudflare.com/ajax/libs/jointjs/3.7.7/joint.js",
  "joint.css"    = "https://cdnjs.cloudflare.com/ajax/libs/jointjs/3.7.7/joint.css"
)

for (filename in names(dependencies)) {
  dest_path <- file.path(lib_dir, filename)
  message("Downloading: ", filename)
  download.file(dependencies[[filename]], destfile = dest_path, mode = "wb")
}
