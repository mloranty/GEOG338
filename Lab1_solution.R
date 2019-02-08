# solutions to Lab 1 questions

library(dplyr)
library(tidyr)


# 1.   from the same data webpage load the *net radiation* data into R

nr <- read.csv("https://arcticdata.io/metacat/d1/mn/v2/object/urn%3Auuid%3A229ad93b-ddfe-4e3f-a32d-d8e8e17eca4d",
               header = T)

nr <- read.csv("https://cn.dataone.org/cn/v2/resolve/urn:uuid:229ad93b-ddfe-4e3f-a32d-d8e8e17eca4d")

# 2.   convert the downward facing longwave radiation data to temperature using the Stefan-Boltzman equation


# 3.   calculate the minimum, maximum, and average radiometric land surface temperature
nr[nr$site=="hd" & nr$sensorZ==800,]
