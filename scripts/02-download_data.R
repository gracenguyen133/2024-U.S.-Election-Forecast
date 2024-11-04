# 02-download_data.R
# Script to load and inspect the raw data
library(here)
library(dplyr)
library(readr)

# Set file path and read data
polls_data <- read_csv(
  here::here("data", "01-raw_data", "president_polls.csv")
)

str(polls_data)