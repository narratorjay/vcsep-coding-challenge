library(tidyverse)
library(dplyr)
library(ggplot2)
setwd("C:\\Users\\Jay\\c3\\redcross")          # remove before uploading

LA_Dep <- read.csv('Edited_Domains_of_Deprivation.csv')
#   names(LA_Dep) yields
# [1] "ï..LSOA_code"       "LSOA_name"          "LA_code"           
# [4] "LA_name"            "IMD_rank"           "IMD_decile"        
# [7] "Income_rank"        "Income_decile"      "Employed_rank"     
#[10] "Employed_decile"    "Education_rank"     "Education_decile"  
#[13] "Health_rank"        "Health_decile"      "Crime_rank"        
#[16] "Crime_decile"       "PoorAccess_rank"    "PoorAccess_decile" 
#[19] "Environment_rank"   "Environment_decile"

# use only deciles for barcharts, remove all odd (and one even-numbered) columns
LA_Dep <- LA_Dep[, -c(2, seq(1, 19, 2))]

# user will select two values from LA_name to compare deprivation between two areas
LA_a <- LA_Dep[LA_Dep$LA_name == "Adur", ]

# suggest stick to health for now to keep display clean
# bring out noise over bias, refer to Daniel Kahneman's book
# and link to intervention would be effective everywhere







ggplot(data = LA_Dep) +
  geom_bar(mapping = aes(y = IMD_decile, x = ))
