library(tidyverse)
library(sf)
library(ggspatial)

# data from https://gdz.bkg.bund.de/index.php/default/wms-verwaltungsgebiete-1-2-500-000-stand-31-12-wms-vg2500.html

# germany <- read_sf("data/vg2500_12-31.utm32s.shape/vg2500/VG2500_LAN.shp")
# 
# germany <- germany %>%
#   filter(GF != 8) %>%
#   select(GF, geometry)

germany_kreise <- read_sf("data/vg2500_12-31.utm32s.shape/vg2500/VG2500_KRS.shp")

cities <- germany_kreise %>%
  #filter(str_detect(GEN, "Würz|Nürn")) %>%
   select(geometry, GEN, AGS) %>%
  mutate(fictional_outcome = round(runif(nrow(.), 0, 100), 0))

ggplot() +
  #ggplot2::geom_sf(data = germany, fill = NA, colour = "black") +
  ggplot2::geom_sf(data = cities, aes(fill = fictional_outcome)) +
  theme_void()
