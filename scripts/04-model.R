#### Preamble ####
# Purpose: Model whether we guessed right based on confidence 
# Author: Gavin Crooks
# Date: 26 March 2024
# Contact: gavin.crooks@mail.utronto.ca
# License: MIT
# Pre-requisites: 02-data_cleaning


#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(arrow)

#### Read data ####
analysis_data <- read_parquet(file = "data/analysis_data/analysis_data.parquet")




# Model data
first_model <- stan_glm(
  formula = Salary ~ Points,
  data = analysis_data,
  family = gaussian(link = "identity"),
  prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_aux = exponential(rate = 1, autoscale = TRUE),
  seed = 93
)

second_model <- stan_glm(
  formula = CapHit ~ Points,
  data = analysis_data,
  family = gaussian(link = "identity"),
  prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_aux = exponential(rate = 1, autoscale = TRUE),
  seed = 93
)

third_model <- stan_glm(
  formula = Salary ~ PointsPerGame,
  data = analysis_data,
  family = gaussian(link = "identity"),
  prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_aux = exponential(rate = 1, autoscale = TRUE),
  seed = 93
)

# Model data
fourth_model <- stan_glm(
  formula = Salary ~ Points + PlusMinus + PointsPerGame,
  data = analysis_data,
  family = gaussian(link = "identity"),
  prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_aux = exponential(rate = 1, autoscale = TRUE),
  seed = 93
)

#### Save model ####
saveRDS(
  first_model,
  file = "models/first_model.rds"
)

saveRDS(
  second_model,
  file = "models/second_model.rds"
)

saveRDS(
  third_model,
  file = "models/third_model.rds"
)

saveRDS(
  fourth_model,
  file = "models/fourth_model.rds"
)
