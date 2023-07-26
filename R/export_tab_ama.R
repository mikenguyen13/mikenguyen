#' Function to export a table
#'
#' @param table A data frame or matrix.
#' @param filename A character string specifying the filename.
#' @param filepath A character string specifying the directory to save the file.
#' @param caption A character string specifying the caption for the table.
#' @import xtable
#' @import rio
#' @importFrom utils capture.output
#' @export
export_tab_ama <- function(table, filename, filepath, caption) {
  # Get current date
  date <- format(Sys.Date(), "%Y-%m-%d")

  # Create LaTeX table using xtable
  xtable <- xtable::xtable(table, caption = caption, label = paste0("table:", filename))

  # If the tex file exists, delete it (i.e., to overwrite the file)
  if (file.exists(file.path(filepath, paste0(filename, ".tex")))){
    file.remove(file.path(filepath, paste0(filename, ".tex")))
  }

  # Check if "archive" directory exists, if not, create it
  if (!dir.exists(file.path(filepath, "archive"))) {
    dir.create(file.path(filepath, "archive"))
  }

  # Export table with current date to "archive" folder as Excel and LaTeX file
  rio::export(table, file.path(filepath ,"archive", paste0(filename, "_", date, ".xlsx")))

  # Export table without current date to current folder as Excel and LaTeX file
  rio::export(table, file.path(filepath , paste0(filename, ".xlsx")))

  # Export LaTeX table
  writeLines(capture.output(print(xtable, type = "latex")), file.path(filepath, paste0(filename, ".tex")))
}
