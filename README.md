# Forecasting the 2024 U.S. Presidential Election: Analyzing Polling Data

## Overview
This analysis examines polling data from FiveThirtyEight's 2024 Presidential Election database to forecast election outcomes, revealing significant momentum for Harris in key battleground states. Using a multinomial logistic regression model with state-level variations, we achieve 90.16% prediction accuracy and find evidence of shifting voter preferences in crucial swing states.

## ey Findings
Harris shows increasing support in battleground states (48% average)
Trump maintains steady support around 45%
Biden shows slight decline to 42%
Geographic variations significantly impact candidate support

## File Structure

├── data/
│   ├── 01-raw_data/          # Original FiveThirtyEight polling data
│   └── 02-analysis_data/     # Cleaned and processed datasets
├── models/
│   └── multinom_model.rds    # Saved model files
├── outputs/
│   ├── figures/              # Generated plots and visualizations
│   └── model_performance.rds # Model validation results
├── paper/
│   ├── paper.qmd            # Main Quarto document
│   ├── paper.pdf            # Compiled paper
│   └── references.bib       # Bibliography
└── scripts/
    ├── 00-simulate_data.R
    ├── 01-test_simulated_data.R
    ├── 02-download_data.R
    ├── 03-clean_data.R
    ├── 04-test_analysis_data.R
    ├── 05-exploratory_data_analysis.R
    └── 06-model_data.R

## LLM Usage Statement
This project utilized ChatGPT 4.0 for the following purposes:

### Code Development & Debugging
- Writing and optimizing R scripts for data analysis
- Debugging code issues in the modeling pipeline
- Enhancing data visualization techniques
- Implementing model validation procedures

### Statistical Analysis
- Refining model specifications
- Implementing cross-validation techniques
- Optimizing polling aggregation methods
- Developing electoral college predictions

### Documentation
- README file structure and content
- Code commenting improvements
- Paper organization suggestions

Complete chat logs are available in usage.txt.

## Reproduction Steps
### Prerequisites

R (version 4.2.3 or higher)
RStudio (recommended for easy project management)
Git (for cloning repository)
Required disk space: ~500MB
Operating system: Windows 10/11, macOS, or Linux

1. Repository Setup
## Clone the repository
git clone https://github.com/RohanAlexander/starter_folder.git
cd starter_folder

## Create necessary directories if they don't exist
mkdir -p data/01-raw_data
mkdir -p data/02-analysis_data
mkdir -p outputs/figures
mkdir -p models

2. Install Required R Packages
# Run this in R or RStudio
install.packages(c(
  "tidyverse",    # For data manipulation and visualization
  "nnet",         # For multinomial logistic regression
  "caret",        # For model training and validation
  "arrow",        # For parquet file handling
  "ggplot2",      # For plotting
  "knitr",        # For document generation
  "modelsummary", # For model results tables
  "lubridate",    # For date handling
  "here"          # For file path management
))

3. Data Preparation
Download the polling data from FiveThirtyEight:
Visit: https://projects.fivethirtyeight.com/polls/president-general/2024/
Click "Download the data"
Save the CSV file to data/01-raw_data/president_polls.csv

4. Run Analysis Scripts
Execute the following R scripts in order:
# In R or RStudio
source("scripts/00-simulate_data.R")         # Generate simulated data
source("scripts/01-test_simulated_data.R")   # Validate simulated data
source("scripts/02-download_data.R")         # Process downloaded data
source("scripts/03-clean_data.R")            # Clean and prepare data
source("scripts/04-test_analysis_data.R")    # Validate cleaned data
source("scripts/05-exploratory_data_analysis.R")  # Generate exploratory plots
source("scripts/06-model_data.R")            # Fit prediction models

5. Generate Paper
# In terminal or command prompt
quarto render paper/paper.qmd

## Expected Outputs
After successful execution, you should see:

- Cleaned dataset in data/02-analysis_data/
- Model files in models/
- Figures in outputs/figures/
- Final paper as PDF in paper/

## Troubleshooting
### Common issues and solutions:

Package Installation Errors

# If you encounter package installation issues, try:
install.packages("pak")
pak::pkg_install(c("tidyverse", "nnet", "caret"))

## Data Loading Issues

# Verify data path using:
list.files("data/01-raw_data")

##File Path Errors

# Use the here package to verify project structure:
library(here)
here::dr_here()
Validation

## To confirm successful reproduction:

Check model performance metrics in outputs/model_performance.rds
Compare figures in outputs/figures/ with paper
Verify final PDF generation in paper/

##Notes

All file paths are relative to project root
Running time: ~10-15 minutes on standard hardware
Required memory: ~4GB RAM
For issues or questions, please open a GitHub issue

## Citation
Copy@misc{election2024forecast,
  author = {Grace Nguyen},
  title = {Forecasting the 2024 US Presidential Election},
  year = {2024},
  publisher = {GitHub},
  url = {https://github.com/gracenguyen133/2024-U.S.-Election-Forecast.git}
}