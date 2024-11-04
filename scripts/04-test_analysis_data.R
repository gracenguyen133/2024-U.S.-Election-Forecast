# 04-test_analysis_data.R
# Script to test actual polling data
library(here)
library(dplyr)

# Load actual polling data
actual_data <- read.csv(
  here::here("data", "02-analysis_data", "cleaned_polls_data.csv")
)

# Check missing values
missing_values_summary <- colSums(is.na(actual_data))
missing_values <- missing_values_summary[missing_values_summary > 0]

if (length(missing_values) > 0) {
  cat("Missing values in columns:\n")
  print(missing_values)
} else {
  cat("No missing values found.\n")
}