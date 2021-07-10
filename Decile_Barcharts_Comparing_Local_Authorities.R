library(tidyverse)
#library(dplyr)
library(ggplot2)
setwd("C:\\Users\\Jay\\c3\\redcross")          # remove before uploading

LA_Dep <- read.csv('Edited_Domains_of_Deprivation.csv')

# use only deciles for barcharts, remove all odd (and one even-numbered) columns containing rank info etc
LA_Dep <- LA_Dep[, -c(2, seq(1, 19, 2))]

# user will select two values from LA_name to compare deprivation between two areas
area_A = "Adur"
area_B = "Birmingham"

area_A_scores <- data.frame(filter(LA_Dep, LA_name == area_A))


ggplot(area_A_scores, aes(Health_decile)) +
  geom_histogram(bins=10, colour = "#0000CC", fill = "#0000EE60") + 
  coord_flip() + 
  labs(title = paste("Relative health of population in Local Authority District", area_A),
       x = "Decile score in England  (higher is better)",
       y = "LSOA count with that health score" ) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), 
        panel.background = element_rect(fill = 'white', colour = 'white'), 
        axis.line = element_line(colour = "#0000BB"))

# suggest stick to health for now to keep display clean
# bring out noise over bias after reading Daniel Kahneman's book
# and add comments that intervention would likely be effective anywhere

