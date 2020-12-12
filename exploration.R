# Data exploration of global economic freedom

# Dependencies
library("tmap")
library("tmaptools")
library("sf")
library("leaflet")

# Import data
data <- read.csv("C:\\Users\\bonem\\OneDrive\\Desktop\\R_we_free_yet\\economic_freedom_index2019_data.csv", 
                 header=TRUE, stringsAsFactors=FALSE)
head(data)

# How many values are listed per collumn?
sapply(data, function(x) length(unique(x)))
# 186 Countries, 5 Regions

# Organize data for the first world map
GDP_data <- c(data$Country.Name, data$GDP.per.Capita..PPP.)
print(GDP_data)

# begin putting GDP_data into map
