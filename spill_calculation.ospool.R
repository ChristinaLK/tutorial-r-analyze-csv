#!/usr/bin/env Rscript

# Read csv file name
args <- commandArgs(trailingOnly=TRUE)
datafile <- args[1]

# Load data
data <- read.csv(datafile)

#Convert spill units to Gallons
retval <- subset(data, Units == 'Pounds')
retval$Quantity <- retval$Quantity/8
retval2 <- subset(data, Units == 'Gallons')

#Create new dataframe
emp.data <- data.frame(
        file_name = c(datafile),
        number_of_spills = c(nrow(data)),
        quantity_in_gallons = c(sum(retval$Quantity)+ sum(retval2$Quantity))
)
print(emp.data)
