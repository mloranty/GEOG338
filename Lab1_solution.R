# solutions to Lab 1 questions

# 1.   from the same data webpage load the *net radiation* data into R

nr <- read.csv("https://arcticdata.io/metacat/d1/mn/v2/object/urn%3Auuid%3A229ad93b-ddfe-4e3f-a32d-d8e8e17eca4d",
               header = T)


# 2.   convert the downward facing longwave radiation data to temperature using the Stefan-Boltzman equation
sb <- 5.67*10^-8
lst <- (nr$IRDn/(0.96*sb))^0.25

# 3.   calculate the minimum, maximum, and average radiometric land surface temperature
min(lst, na.rm = T)
# 247.0301

max(lst, na.rm = T)
# 312.0318

mean(lst, na.rm = T)
#280.6988