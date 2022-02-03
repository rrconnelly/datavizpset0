###########################################################
# Data Visualization for Public Informatics Problem Set 0 #
###########################################################

# Instructions

# Your first assignment will be to apply concepts learned in the first two lectures to read in a dataset to R and implement basic data analysis tools to demonstrate
# your understanding of R.

# Complete this R code and answer all questions as comments by matching this format and prefacing your answer with the # symbol.

## Learning Objectives

# After you complete the exercises in this notebook, you should be able to do the following:
  
# Read in a CSV format dataset into R and understand the functions needed to do so. 
# Describe the structure and content of a dataset using basic data exploration functions in R.
# Group, summarize & filter the dataset using the `{dplyr}` package to prepare data for visualization.
# Produce simple plots of the data using base R to quickly explore the data.

# Data
# For this problem set we will use the following dataset that tracks the housing market at the ZIP code level.
# The dataset can be found at https://econdata.s3-us-west-2.amazonaws.com/Reports/Core/RDC_Inventory_Core_Metrics_Zip_History.csv

# Part 0: Environment setup
# Load any required libraries using the library() function in this section.
library(tidyverse)

# Part 1: Reading in the data.
# Prepare R code to read in the the dataset to your R session using the tidyverse. Assign your dataframe the name "housing."
housing <- read_csv("https://econdata.s3-us-west-2.amazonaws.com/Reports/Core/RDC_Inventory_Core_Metrics_Zip_History.csv")

# Part 2: Inspecting the data
# Using base R data exploration functions, inspect the housing dataset you've created and answer the following questions.
# Show code for all answers.

# 1. What are the dimensions of your dataset? How many columns and how many rows does it have?
nrow(housing)
ncol(housing)
# the dataset has 1905956 rows and 40 columns

# 2. Take a look at the structure of the data. What is the most common data type within this dataset?
str(housing)
#the most common data type is numeric 

# 3. Show the first few rows of the dataset
housing %>% head()

# 4. Print a summary of the dataset using R
housing %>% summary()

# 5. Using the summary that you've created, write down the maximum value of the column 'median_listing_price_per_square_foot'
# the maximum for "median_listing_price_per_square_foot" is 825000.0

# Part 3: Transform, filter & visualize the data
# This dataset is quite large. We will filter and summarize it in this section before visualizing it.

# 1. Use dplyr to filter the dataset to the month of December, 2021 (202112). Use the column month_date_yyyymm to filter the data.
# Store your filtered dataset under the name housing_dec_21
housing_dec_21 <- housing %>% filter(month_date_yyyymm == "202112")

# 2. Use base R graphics to plot the median_listing_price column from housing_dec_21 with the default options. Be sure to access your data using the $ operator
plot(housing_dec_21$median_listing_price)

# 3. Take your answer to the previous question and change it from a scatterplot to a histogram using the "type" argument to the plot() function. Run help(plot) if you are unclear.
plot(housing_dec_21$median_listing_price, type = "h")

# 4. Pick another variable of your choice from the dataset and visualize it as you did in the previous question.
plot(housing_dec_21$median_days_on_market, type = "h")

# 5. Use dplyr to rearrange your housing_dec_21 dataset. Arrange it by the median_listing_price in descending order. List the top 3 postal codes by median listing price.
housing_dec_21 %>% arrange(desc(median_listing_price))
# the top 3 postal codes by median listing price are 31004, 10985, and 02543

# 6. Follow the same steps as the previous question, but eliminate the descending order. Identify the bottom 3 postal codes for median listing price.
housing_dec_21 %>% arrange(median_listing_price)
# the bottom 3 postal codes for median listing price are 44624, 44878, 26169
