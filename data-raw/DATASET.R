## Get required javascript libraries
lib_dir <- "inst/htmlwidgets/lib"
if (!dir.exists(lib_dir)) dir.create(lib_dir, recursive = TRUE)

dependencies <- list(
  "jquery.min.js"    = "https://code.jquery.com/jquery-4.0.0.min.js",
  "lodash.min.js"    = "https://raw.githubusercontent.com/lodash/lodash/4.18.1-npm/lodash.js",
  "backbone-min.js"  = "https://backbonejs.org/backbone-min.js",
  "joint.min.js"     = "https://cdnjs.cloudflare.com/ajax/libs/jointjs/3.7.7/joint.min.js",
  "joint.min.css"    = "https://cdnjs.cloudflare.com/ajax/libs/jointjs/3.7.7/joint.min.css"
)

for (filename in names(dependencies)) {
  dest_path <- file.path(lib_dir, filename)
  message("Downloading: ", filename)
  download.file(dependencies[[filename]], destfile = dest_path, mode = "wb")
}
