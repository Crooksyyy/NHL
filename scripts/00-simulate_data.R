#### Preamble ####
# Purpose: Simulates NHL Player Data
# Author: Gavin Crooks
# Date: 26 March 2024
# Contact: gavin.crooks@mail.utronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)


#### Simulate data ####
# Set seed for reproducibility
set.seed(93)
# Generate player IDs
player_ids <- paste0("Player_", 1:num_players)

# Generate random points, goals, and assists data using Poisson distribution
points <- rpois(num_players, lambda = 30)
goals <- rpois(num_players, lambda = 15)
assists <- rpois(num_players, lambda = 15)

# Ensure no negative values
points <- pmax(0, points)
goals <- pmax(0, goals)
assists <- pmax(0, assists)

# Calculate total points as sum of goals and assists
total_points <- goals + assists

# Generate random contract costs in millions
cost_millions <- round(runif(num_players, min = 0.5, max = 10), 2)

# Create data frame
player_data <- data.frame(
  Player_ID = player_ids,
  Points = total_points,
  Goals = goals,
  Assists = assists,
  Cost_Millions = cost_millions
)

# Display sample of generated data
print(head(player_data))






