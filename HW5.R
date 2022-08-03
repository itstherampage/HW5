library(dplyr)
library(ggplot2)
library(tidyr)
library(ggrepel)
library(grid)
library(gridExtra)
library(gtable)
library(tibble)
library(lubridate)
library(cowplot)
library(magick)
library(maps)
library(forcats)
library(ggmap) 
library(statebins) 
library(geofacet)
library(ggspatial) 
library(colorspace) 
library(cowplot) 
library(lubridate) 
library(mapproj)


setwd('C:/Users/logan/Desktop/Summer2022/DataVisualization')

map = map_data("state")
california <- map %>% filter((map$region) == "california")

load('DATA/wind_turbines.rda')

wind_ca <- wind_turbines %>% filter((wind_turbines$t_state) == "CA")

ggplot(data = california,
            mapping = aes(x = long, y = lat)) + 
  geom_polygon(color = "black", size = 0.1) +
  coord_map(projection = "albers", lat0 = 39, lat1 = 45) +
  guides(fill = FALSE)+ 
  geom_point(
  data = wind_ca,
  aes(x = xlong, y = ylat ),
  size = 0.1,
  color = "#A825A8",
  alpha = 2/3
)


