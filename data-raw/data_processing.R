# Description ------------------------------------------------------------------
# R script to process uploaded raw data into a tidy, analysis-ready data frame
# Load packages ----------------------------------------------------------------
## Run the following code in console if you don't have the packages
## install.packages(c("usethis", "fs", "here", "readr", "readxl", "openxlsx", "dplyr"))
library(usethis)
library(fs)
library(here)
library(readr)
library(dplyr)
library(readxl)
library(openxlsx)

# Load Data --------------------------------------------------------------------
# Load the raw survey data for artesian wells mapping in Malawi
# This CSV file contains field data collected from various artesian well sites
data_in <- readr::read_csv("data-raw/mapping artesian wells.csv")

# (Optional) Read and clean the codebook if needed (commented out for now)
# codebook <- readxl::read_excel("data-raw/codebook.xlsx") %>%
#   clean_names()

# Tidy data --------------------------------------------------------------------
# Remove incomplete records: filter out rows missing GPS coordinates
# This ensures all mapped wells have valid location data
data_in <- data_in %>%
  filter(!is.na(latitude))


# Function to check for non-UTF-8 characters in character columns
check_utf8 <- function(df) {
  # Identify columns with invalid UTF-8 characters
  invalid_cols <- sapply(df, function(column) {
    if (!is.character(column)) return(FALSE) # Skip non-character columns
    any(sapply(column, function(x) {
      if (is.na(x)) return(FALSE) # Ignore NA values
      !identical(iconv(x, from = "UTF-8", to = "UTF-8"), x)
    }))
  })

  # Extract the column names with invalid characters
  bad_cols <- names(df)[invalid_cols]

  # Output a message depending on whether non-UTF-8 characters were found
  if (length(bad_cols) > 0) {
    message("Non-UTF-8 characters detected in columns: ",
            paste(bad_cols, collapse = ", "))
  } else {
    message("No non-UTF-8 characters found.")
  }
}

# Character encoding conversion ---------------------------------------------
# Convert all character columns from Latin1 to UTF-8 encoding
# This ensures compatibility and proper display of special characters
# Any unconvertible characters are removed (sub = "")
data_in[] <- lapply(data_in, function(x) {
  if (is.character(x)) {
    # Convert to UTF-8 and remove problematic characters
    iconv(x, from = "latin1", to = "UTF-8", sub = "")
  } else {
    x
  }
})

# Re-check the data for non-UTF-8 characters after the conversion
check_utf8(data_in)

# Create final dataset ---------------------------------------------------------
# Assign the cleaned data to the package's main dataset name
artesianwells <- data_in

# Export Data ------------------------------------------------------------------
# Save the processed data in multiple formats:
# 1. As an R data object (.rda) in the data/ directory
# 2. As a CSV file in inst/extdata/ for easy access
# 3. As an Excel file in inst/extdata/ for non-R users
# Final dataset contains 44 artesian wells across 29 variables
usethis::use_data(artesianwells, overwrite = TRUE)
fs::dir_create(here::here("inst", "extdata"))
readr::write_csv(artesianwells,
                 here::here("inst", "extdata", paste0("artesianwells", ".csv")))
openxlsx::write.xlsx(artesianwells,
                     here::here("inst", "extdata", paste0("artesianwells",
                                                          ".xlsx")))


