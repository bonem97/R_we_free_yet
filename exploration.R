# Data exploration of global economic freedom

# Dependencies
library("maps")
library("ggplot2")
library("mapproj")

# Import data
data <- read.csv("C:\\Users\\bonem\\OneDrive\\Desktop\\R_we_free_yet\\economic_freedom_index2019_data.csv", 
                 header=TRUE, stringsAsFactors=FALSE)
head(data)

# How many values are listed per column?
sapply(data, function(x) length(unique(x)))
# 186 Countries, 5 Regions

# Organize data for the first world map
region <- c(data$Country.Name)
gdp_pc_column <- c(data$GDP.per.Capita..PPP.)
GDP_data <- data.frame(region, gdp_pc_column)
print(GDP_data)

# begin putting GDP_data into map
map_world <- map_data("world")
head(map_world)

# Construct map
ggplot() +
  geom_map(data = map_world, 
           map = map_world,
           aes(x = long, 
               y = lat, 
               group = group, 
               map_id = region),
           fill = none,  
           colour = "#7f7f7f", 
           size=0.5) + 
  geom_map(data = GDP_data, 
           map = map_world,
           aes(fill = gdp_pc_column, 
               map_id = region),
           colour="#7f7f7f", 
           size=0.5) +
  coord_map("rectangular", 
            lat0=0, 
            xlim=c(-180,180), 
            ylim=c(-90, 90)) +
  scale_fill_continuous(low="thistle2", 
                        high="darkred", 
                        guide="colorbar") +
  scale_y_continuous(breaks=c()) +
  scale_x_continuous(breaks=c()) +
  labs(fill="legend", 
       title="Title", 
       x="", 
       y="") +
  theme_bw()
