
library(janitor)
library(sf)
library(tidyverse)
library(tidycensus)
library(dplyr)
library(stringr)

#reading in the ACS 5 year Poverty Census Data for DC Census Tracts
acs_poverty_dc <- read.csv("/Users/hhoffmann/Desktop/Food-Deserts-Ward-8-DC/ACSST5Y2021.S1701_2023-11-30T181731/ACSST5Y2021.S1701-Data.csv") 

#cleaning data 
acs_clean <- clean_names(acs_poverty_dc)

#selecting only columns needed for analysis and filtering to get rid of first row
acs_selected <- acs_clean %>% 
  select(geo_id, name, s1701_c01_001e, s1701_c03_001e)

#removing first row of nonimportant numbers
acs_selected <- acs_selected [-c(1), ]

#mutate GeoID beginning string to remove 1400000US 
acs_mutate <- acs_selected %>% 
  mutate(geo_id = str_replace(geo_id, "1400000US", ""))

#export as CSV
write.csv(acs_mutate, "povertycensus.csv", row.names = FALSE)




