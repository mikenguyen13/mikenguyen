# Load the necessary packages
library(testthat)
library(rio)

# Define the test
test_that("export_tab_ama correctly exports table", {
  # Create a temporary directory to save the files
  temp_dir <- tempdir()

  # Create a simple data frame for testing
  table <- data.frame(a = 1:3, b = letters[1:3])

  # Run the function and save the files in the temporary directory
  export_tab_ama(table, "test_table", temp_dir, "Test Caption")

  # Check that the files were created
  expect_true(file.exists(file.path(temp_dir, "test_table.xlsx")))
  expect_true(file.exists(file.path(temp_dir, "archive", paste0("test_table_", format(Sys.Date(), "%Y-%m-%d"), ".xlsx"))))
  expect_true(file.exists(file.path(temp_dir, "test_table.tex")))

  # Check that the Excel files contain the correct data
  expect_equal(rio::import(file.path(temp_dir, "test_table.xlsx")), table)
  expect_equal(rio::import(file.path(temp_dir, "archive", paste0("test_table_", format(Sys.Date(), "%Y-%m-%d"), ".xlsx"))), table)

  # Clean up by deleting the files created in the temporary directory
  file.remove(file.path(temp_dir, "test_table.xlsx"))
  file.remove(file.path(temp_dir, "archive", paste0("test_table_", format(Sys.Date(), "%Y-%m-%d"), ".xlsx")))
  file.remove(file.path(temp_dir, "test_table.tex"))
})
