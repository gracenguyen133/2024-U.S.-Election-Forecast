# 03-clean_data.R
# Script to clean and preprocess the polling data
library(here)
library(dplyr)
library(lubridate)
library(arrow)

# Load raw data
polls_data <- read_csv(
  here::here("data", "01-raw_data", "president_polls.csv")
)

# Clean data
cleaned_data <- polls_data %>%
  filter(!is.na(pollster), !is.na(candidate_name), !is.na(pct)) %>%
  mutate(
    start_date = mdy(start_date),
    end_date = mdy(end_date),
    election_date = mdy(election_date),
    candidate_name = trimws(candidate_name),
    state = ifelse(is.na(state), "National", state)
  ) %>%
  select(pollster, start_date, end_date, candidate_name, pct, 
         sample_size, state, methodology, party, election_date)

# Save cleaned data in both formats
write_csv(cleaned_data, 
          here::here("data", "02-analysis_data", "cleaned_polls_data.csv"))

write_parquet(cleaned_data, 
              here::here("data", "02-analysis_data", "cleaned_polls_data.parquet"))