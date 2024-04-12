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
merged_raw_data <- read_csv("data/raw_data/merged_raw_data.csv")

# Selecting only the required columns 
cleaned_data <- merged_raw_data[, c("Player", "Pos", "GP", "G", "A", "P", "+/-", "P/GP", "TOI/GP", "Salary", "Cap Hit")]

# Rename the columns for better readability
names(cleaned_data) <- c("Player", "Position", "GamesPlayed", "Goals", "Assists", "Points", "PlusMinus", "PointsPerGame", "TimeOnIcePerGame", "Salary", "CapHit")

# Drop rows with missing data
cleaned_data <- na.omit(cleaned_data)


#### Save data ####
write_parquet(cleaned_data, "data/analysis_data/analysis_data.parquet")

write_csv(cleaned_data,"data/analysis_data/analysis_data.csv")
