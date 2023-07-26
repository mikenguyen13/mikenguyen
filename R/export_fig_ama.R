#' Function to export a figure with AMA theme
#'
#' @param figure A ggplot2 object.
#' @param filename A character string specifying the filename.
#' @param filepath A character string specifying the directory to save the file.
#' @import ggplot2
#' @import lubridate
#' @export
export_fig_ama <- function(figure, filename, filepath) {
  # Apply custom theme to figure
  figure <- figure + amatheme()

  # Get current date
  date <- format(Sys.Date(), "%Y-%m-%d")

  # Check if "archive" directory exists in the specified export path, if not, create it
  archive_dir <- file.path(filepath, "archive")
  if (!dir.exists(archive_dir)) {
    dir.create(archive_dir, recursive = TRUE)
  }

  # Export figure with current date to "archive" folder
  archive_filename <- file.path(archive_dir, paste0(filename, "_", date, ".jpg"))
  ggplot2::ggsave(filename = archive_filename, plot = figure)

  # Export figure without current date to the specified export path
  current_filename <- file.path(filepath, paste0(filename, ".jpg"))
  ggplot2::ggsave(filename = current_filename, plot = figure)
}
