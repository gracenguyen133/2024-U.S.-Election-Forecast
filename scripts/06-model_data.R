# 06-model_data.R
# Load necessary libraries
library(here)
library(dplyr)
library(nnet)  # For multinomial logistic regression
library(caret)

# Load the cleaned data
file_path <- here::here("data", "02-analysis_data", "cleaned_polls_data.csv")
cleaned_data <- read_csv(file_path)

# Filter data for major candidates
model_data <- cleaned_data %>%
  filter(candidate_name %in% c("Joe Biden", "Donald Trump", "Kamala Harris")) %>%
  select(candidate_name, pct, sample_size, state, methodology, party) %>%
  na.omit()

# Convert categorical variables to factors
model_data <- model_data %>%
  mutate(state = as.factor(state),
         methodology = as.factor(methodology),
         party = as.factor(party),
         candidate_name = as.factor(candidate_name))  # Multinomial outcome

# Split data into training and testing sets (70-30 split)
set.seed(123)
trainIndex <- createDataPartition(model_data$candidate_name, p = 0.7, list = FALSE, times = 1)
training_set <- model_data[trainIndex, ]
testing_set <- model_data[-trainIndex, ]

# Train the multinomial logistic regression model
set.seed(123)
multinom_model <- multinom(candidate_name ~ pct + sample_size + state + methodology + party, data = training_set)

# Display the model summary
summary(multinom_model)

# Predict on the testing set
testing_set$predicted_class <- predict(multinom_model, newdata = testing_set)

# Evaluate the model performance
confusion_matrix <- confusionMatrix(as.factor(testing_set$predicted_class), as.factor(testing_set$candidate_name))

# Print the confusion matrix and accuracy
print(confusion_matrix)

# Save the fitted model to a file in the models directory
model_file_path <- here::here("models", "multinom_model.rds")
saveRDS(multinom_model, file = model_file_path)
