# M. Loranty; 02/21/19
# script to downlaod, temporally aggregate, and plot
# net radiation data from high- and low-density forests
# near Cherskiy in northeastern Siberia

#load required packages
library(dplyr)
library(lubridate)

#read the csv file directly from Arctic Data Center repository
nr <- read.csv("https://arcticdata.io/metacat/d1/mn/v2/object/urn%3Auuid%3A229ad93b-ddfe-4e3f-a32d-d8e8e17eca4d",
               header = T)


# create a new object called t_month that is identical to our t_air dataframe and pipe it to the next line
nr_day <- nr %>%
  
  # group the data by year, month, site, and sensor height, and pipe to the next line  
  group_by(year,doy,site,sensorZ) %>%
  
  # summarize data - calculate the mean and standard deviation for number of observations for each month
  summarize(sw = mean(SRUp,na.rm=T),
            sw.sd = sd(SRUp,na.rm=T),
            n_obs <- n())

# check out the new data frame
head(nr_day)

#subset high-density date at 1m height for June 2017
hd1 <- nr_day[nr_day$year == 2017 & nr_day$doy < 182 & nr_day$doy > 151 & nr_day$site == "hd" & nr_day$sensorZ == 100,]
#subset high-density date at 8m height for June 2017
hd8 <- nr_day[nr_day$year == 2017 & nr_day$doy < 182 & nr_day$doy > 151 & nr_day$site == "hd" & nr_day$sensorZ == 800,]
#subset low-density date at 1m height for June 2017
ld1 <- nr_day[nr_day$year == 2017 & nr_day$doy < 182 & nr_day$doy > 151 & nr_day$site == "ld" & nr_day$sensorZ == 100,]
#subset low-density date at 8m height for June 2017
ld8 <- nr_day[nr_day$year == 2017 & nr_day$doy < 182 & nr_day$doy > 151 & nr_day$site == "ld" & nr_day$sensorZ == 800,]

# make a plot with the subsets for June 2017
# this sets the y-axis limits to the range of data
# label the axis
plot(ld8$doy, ld8$sw,lty=1,lwd=2,type = "l",
     ylim = c(0,380), 
     xlab = "Day of Year",
     ylab = expression(paste("SW (W ",m^-2,")",sep="")))

# add the remaining data to the plot
lines(ld1$doy, ld1$sw,lty=2,lwd=2)
lines(hd1$doy, hd1$sw,lty=2,lwd=2,col="red")
lines(hd8$doy, hd8$sw,lty=1,lwd=2,col="red")

# add a legend to the plot
legend("bottom",c("High Density","Low Density"),fill=c("red", "black"),bty="n")



