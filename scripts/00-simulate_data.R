#### Preamble ####
# Purpose: Simulates NHL Player statistics and salary data
# Author: Gavin Crooks
# Date: 26 March 2024
# Contact: gavin.crooks@mail.utronto.ca

#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
# Set seed for reproducibility
set.seed(93)

# Set number of players
num_players <- 500
# Generate player IDs
player_ids <- paste0("Player_", 1:num_players)

# Generate random points, goals, and assists data using Poisson distribution
points <- rpois(num_players, lambda = 30)
goals <- rpois(num_players, lambda = 15)
assists <- rpois(num_players, lambda = 15)
plus_minus <- round(rnorm(num_players, mean = 0, sd = 8))

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
  Plus_minus = plus_minus,
  Cost_Millions = cost_millions
)

# Display sample of generated data
print(head(player_data))

# Save simulated data
write_csv(player_data, "data/simulated_data/simulated_data.csv")





