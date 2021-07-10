library(tidyverse)
library(dplyr)
library(ggplot2)
setwd("C:\\Users\\Jay\\c3\\redcross")          # remove before uploading

LA_Dep <- read.csv('Edited_Domains_of_Deprivation.csv')
#names(LA_Dep)
# [1] "ï..LSOA_code"       "LSOA_name"          "LA_code"           
# [4] "LA_name"            "IMD_rank"           "IMD_decile"        
# [7] "Income_rank"        "Income_decile"      "Employed_rank"     
#[10] "Employed_decile"    "Education_rank"     "Education_decile"  
#[13] "Health_rank"        "Health_decile"      "Crime_rank"        
#[16] "Crime_decile"       "PoorAccess_rank"    "PoorAccess_decile" 
#[19] "Environment_rank"   "Environment_decile"

## only use deciles to compare Local Authority Deprivation
for (EvenColumn in seq(4, 20, 2)){LA_Dep_Decile[EvenColumn/2 -1] <- LA_Dep[EvenColumn]}







ggplot(data = LA_Dep) +
  geom_bar(mapping = aes(y = IMD_decile, x = ))
