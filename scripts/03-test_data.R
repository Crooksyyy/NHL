#### Preamble ####
# Purpose: Tests the dataset to ensure it was cleaned appropriately
# Author: Gavin Crooks
# Date: 12 April 2024
# Contact: gavin.crooks@mail.utoronto.ca
# Pre-requisites: 01-download_data.R and 02-data_cleaning.R

#### Workspace setup ####
library(tidyverse)
library(arrow)
library(testthat)

cleaned_data <- read_parquet("data/analysis_data/analysis_data.parquet")

#### Test data ####

# Test for number of variables
cleaned_data %>% 
  unique() %>% 
  length() == 11

# Test for accurate max and min of stats such as goals, points, and assists 
cleaned_data$Goals |> max() <= 68
cleaned_data$Goals |> min() >= 0 
cleaned_data$Points |> max() <= 145
cleaned_data$Points |> min() >= 0
cleaned_data$Assists |> max() <= 100
cleaned_data$Assists |> min() >= 0

# Function to check if Goals + Assists = Points
# Function found via Stack Overflow
check_goals_assists_points <- function(data) {
  # Calculate the sum of goals and assists
  total_goals_assists <- data$Goals + data$Assists
  
  # Check if the sum of goals and assists equals points
  all(total_goals_assists == data$Points)
}

test_that("Goals + Assists = Points", {
  expect_true(check_goals_assists_points(cleaned_data))
})

# Test correct positions 
cleaned_data$Position |> unique() %in% c("D", "C", "R", "L")

# Tests Salary and Cap hit are logical
cleaned_data$CapHit |> max() <= 13000000
cleaned_data$CapHit |> min() >= 250000
cleaned_data$Salary |> max() <= 13000000
cleaned_data$Salary |> min() >= 400000

# Check for missing values 
is.na(cleaned_data) 

