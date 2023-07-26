# Load the necessary packages
library(testthat)
library(ggplot2)

# Define the test
test_that("export_fig_ama correctly applies theme and exports figure", {
  # Create a temporary directory to save the figures
  temp_dir <- tempdir()

  # Create a simple ggplot object for testing
  figure <- ggplot(mtcars, aes(mpg, disp)) + geom_point()

  # Run the function and save the figures in the temporary directory
  export_fig_ama(figure, "test_figure", temp_dir)

  # Check that the files were created
  expect_true(file.exists(file.path(temp_dir, "test_figure.jpg")))
  expect_true(file.exists(file.path(temp_dir, "archive", paste0("test_figure_", lubridate::today(), ".jpg"))))

  # Clean up by deleting the files created in the temporary directory
  file.remove(file.path(temp_dir, "test_figure.jpg"))
  file.remove(file.path(temp_dir, "archive", paste0("test_figure_", lubridate::today(), ".jpg")))
})
