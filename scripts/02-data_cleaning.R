#### Preamble ####
# Purpose: Cleans the raw 2 Truths and 1 lie data
# Author: Gavin Crooks
# Date: 26 March 2024
# Contact: gavin.crooks@mail.utronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)
library(arrow)

#### Clean data ####
raw_data <- read_csv("~/NHL/data/raw_data/Two truths and one lie (Responses) - Form responses 1.csv")

cleaned_data <-
  raw_data |>
  janitor::clean_names() |>
  select(-timestamp) |>
  rename(c(certainty = how_certain_about_your_guess_are_you,
           outcome = what_was_the_outcome)) |> 
  mutate(
    outcome = if_else(outcome == "Guessed right",
                      1,
                      0))


#### Save data ####
write_parquet(cleaned_data, "data/analysis_data/analysis_data.parquet")

