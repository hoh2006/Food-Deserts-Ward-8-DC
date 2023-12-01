
library(janitor)
library(sf)
library(tidyverse)
library(tidycensus)

census_api_key("dd9da6fa26b75b06a926e9c3d8d686facefba449", install = TRUE, overwrite = TRUE)
readRenviron("~/.Renviron")

census_tract_economics <- read_csv("/Users/hhoffmann/Downloads/ACS_Economic_Characteristics_DC_Census_Tract.csv")

