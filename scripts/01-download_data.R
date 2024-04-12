#### Preamble ####
# Purpose: Downloads and saves the data from [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(readxl)
library(arrow)

# Read excel files 
nhl_stats <- read_excel("data/raw_data/nhl_stats.xlsx")

nhl_stats1 <- read_excel("data/raw_data/nhl_stats1.xlsx")

nhl_stats2 <- read_excel("data/raw_data/nhl_stats2.xlsx")

nhl_stats3 <- read_excel("data/raw_data/nhl_stats3.xlsx")

nhl_stats4 <- read_excel("data/raw_data/nhl_stats4.xlsx")

nhl_stats5 <- read_excel("data/raw_data/nhl_stats5.xlsx")

nhl_stats6 <- read_excel("data/raw_data/nhl_stats6.xlsx")

nhl_stats7 <- read_excel("data/raw_data/nhl_stats7.xlsx")

nhl_stats8 <- read_excel("data/raw_data/nhl_stats8.xlsx")

nhl_stats9 <- read_excel("data/raw_data/nhl_stats9.xlsx")

# Combine all dataframes into one
raw_stats_data <- bind_rows(
  list(
    nhl_stats = nhl_stats,
    nhl_stats1 = nhl_stats1,
    nhl_stats2 = nhl_stats2,
    nhl_stats3 = nhl_stats3,
    nhl_stats4 = nhl_stats4,
    nhl_stats5 = nhl_stats5,
    nhl_stats6 = nhl_stats6,
    nhl_stats7 = nhl_stats7,
    nhl_stats8 = nhl_stats8,
    nhl_stats9 = nhl_stats9)
)

# Read salary data 
Salary_data <- read_excel("data/raw_data/Salary_data.xlsx")

# Combine Salary and statistics data into one dataset 
combined_data <- merge(raw_stats_data, Salary_data, by = "Player", all.x = TRUE)

# Save data
write_parquet(x = combined_data,
              sink = "data/raw_data/merged_raw_data.parquet")

write_csv(combined_data,"data/raw_data/merged_raw_data.csv" )
