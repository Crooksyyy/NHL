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

analysis_data |>
  ggplot(aes(x = certainty, y = outcome)) +
  geom_jitter(height = 0)


### Model data ####
first_model <-
  stan_glm(
    formula = outcome ~ certainty,
    data = analysis_data,
    family = binomial(link = "logit"),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 853
  )

summary(first_model)

#### Save model ####
saveRDS(
  first_model,
  file = "models/first_model.rds"
)

