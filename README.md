# An Analysis of NHL Players 

## Overview

Welcome to the NHL Player Contract Analysis Repo!

This repo focuses on examining NHL player contracts, specifically exploring the relationship between player performance and salary cap implications. Through detailed analysis of player statistics and contract data, we aim to gain insights into the economics and dynamics of NHL player contracts.

By employing statistical analysis and modeling techniques, our goal is to provide a better understanding of the factors that drive player valuations and salary determinations in the NHL. We hope that our findings will offer practical insights for teams, players, and fans interested in understanding the complexities of NHL player contracts.


## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from Hockey-Reference.ca 
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `model` contains fitted models. 
-   `other` contains details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.

## Data 
The dataset for this repository was collected on April 12, 2024, comprising the latest NHL player statistics for the 2023-24 season. The primary source of this data was the NHL website (https://www.nhl.com/stats/skaters), chosen for its up-to-date information. Due to limitations on data downloads, only 50 players' statistics could be accessed at once. To overcome this constraint, data for 500 players was collected, later consolidated into a single dataset through the `scripts/01-download_data.R` script. Additionally, salary information was sourced from hockey reference (https://www.hockey-reference.com/friv/current_nhl_salaries.cgi) and integrated with the 500-player dataset, resulting in a final dataset containing 448 players with comprehensive data. All data is available in the the `data` folder. 

The data from the NHL website would up date with the most current statistics, because of this the data was captured at a specific time for reproducability. 

## Statement on LLM usage

Aspects of the code were written with the help of Chat GPT 3.5. Aspects of the paper were also written with assistance from Chat GPT3.5 and the use of grammerly to ensure writing quality. The entire LLM chat interaction is available at `other/llm/`.
