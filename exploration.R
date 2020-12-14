# Data exploration of global economic freedom

# Dependencies
library("tmap")
library("tmaptools")
library("sf")
library("leaflet")
install.packages("maps")
library("maps")

# Import data
data <- read.csv("C:\\Users\\bonem\\OneDrive\\Desktop\\R_we_free_yet\\economic_freedom_index2019_data.csv", 
                 header=TRUE, stringsAsFactors=FALSE)
head(data)

# How many values are listed per collumn?
sapply(data, function(x) length(unique(x)))
# 186 Countries, 5 Regions

# Organize data for the first world map
name_column <- c(data$Country.Name)
gdp_pc_column <- c(data$GDP.per.Capita..PPP.)
GDP_data <- data.frame(name_column, gdp_pc_column)
print(GDP_data)

# begin putting GDP_data into map
map.world <- map_data("world")
head(map.world)
