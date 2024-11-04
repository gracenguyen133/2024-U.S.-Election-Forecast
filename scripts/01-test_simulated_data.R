# 01-test_simulated_data.R
# Script to test simulated polling data
library(here)
library(dplyr)

# Load the simulated data
simulated_data <- read.csv(
  here::here("data", "02-analysis_data", "simulated_polls_data.csv")
)

# Test conditions
missing_values <- sum(is.na(simulated_data))
if (missing_values > 0) {
  stop("Data contains missing values!")
}

# Check percentages range
if (any(simulated_data$pct < 30 | simulated_data$pct > 50)) {
  stop("Polling percentages out of range!")
}

# Validate candidate names
valid_candidates <- c("Joe Biden", "Donald Trump", "Kamala Harris")
if (any(!simulated_data$candidate_name %in% valid_candidates)) {
  stop("Invalid candidate names found in the data!")
}

summary(simulated_data)