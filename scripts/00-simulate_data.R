# 00-simulate_data.R
# Script to simulate polling data for candidates
library(here)

# Create necessary directories
dir.create(here::here("data", "01-raw_data"), recursive = TRUE, showWarnings = FALSE)
dir.create(here::here("data", "02-analysis_data"), recursive = TRUE, showWarnings = FALSE)
dir.create(here::here("outputs", "figures"), recursive = TRUE, showWarnings = FALSE)
dir.create(here::here("models"), recursive = TRUE, showWarnings = FALSE)

set.seed(123)  # For reproducibility

# Parameters for simulation
num_polls <- 1000
candidates <- c("Joe Biden", "Donald Trump", "Kamala Harris")

# Simulate polling data
polls_data <- data.frame(
  poll_id = 1:num_polls,
  candidate_name = sample(candidates, num_polls, replace = TRUE),
  pct = runif(num_polls, 30, 50),
  sample_size = sample(300:1500, num_polls, replace = TRUE),
  state = sample(state.abb, num_polls, replace = TRUE)
)

# Save simulated data
write.csv(polls_data, 
          here::here("data", "02-analysis_data", "simulated_polls_data.csv"), 
          row.names = FALSE)

