library(fpp2)
library(zoo)
library(readr)
library(dplyr)
library(grid)

set.seed(506)

# Load in data  
data<- read_csv("data.csv")
View(data)

# Create Subsets for each junction
j1 <- subset(data, Junction == 1)
j2 <- subset(data, Junction == 2)
j3 <- subset(data, Junction == 3)
j4 <- subset(data, Junction == 4)

# Create time series for no vehicles at each junction
j1.ts <- ts(j1$Vehicles, frequency = 24)
j2.ts <- ts(j2$Vehicles, frequency = 24)
j3.ts <- ts(j3$Vehicles, frequency = 24)
j4.ts <- ts(j4$Vehicles, frequency = 24)

# Examine Time Plots and ACFs for each series
# Junction 1 
  # shows positive additive trend and multiplicative seasonality
  # ACF shows definite cyclical behavior, very high autocorrelation 
autoplot(j1.ts)
labs(title = "Vehicles at Junction 1",
     x = "Time", 
     y = "# Vehicles ")

acf(j1.ts)

## Junction 2 
  # shows multiplicative trend ? and seasonality
  # possible outlier around season 50
  # ACF shows definite cyclical behavior, very high autocorrelation 
autoplot(j2.ts) +
labs(title = "Vehicles at Junction 2",
     x = "Time", 
     y = "# Vehicles ")

acf(j2.ts)

## Junction 3 
  # slight upward trend
  # acf plot shows definitive cyclical nature but time plot is unclear of seasonality
  # high variation in the number of vehicles per day
  # possible outliters that are that high? Or just peak times 
autoplot(j3.ts)+
labs(title = "Vehicles at Junction 3",
     x = "Time", 
     y = "# Vehicles ")

acf(j3.ts)

## Junction 4 
  # no apparent trend, mean seems to be 0 
  # acf plot shows definitive cyclical nature but time plot is unclear of seasonality
  # high variation in the number of vehicles per day
  # possible outliters that are that high? Or just peak times 
autoplot(j4.ts) +
labs(title = "Vehicles at Junction 4",
     x = "Time", 
     y = "# Vehicles ")

acf(j4.ts)

# overall these plots / series just look messy

