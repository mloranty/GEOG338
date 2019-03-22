# Lab 2 Assignment
# 1. Read in the v_swc.csv data file from the Arctic Data Center webpage. 
# 
# 2. Create subsets for the high- and low-density study sites. 
# 
# 3. Calculate the mean soil moisture for each site in July 2016 and July 2017. Note you will need to choose a specific depth here, as the are multiple measurement depths. 
# 
# 4. In addition to your calculations from step 3, provide a short description of a) what depth(s) you chose and why, and b) what patterns do you observe in the data? Is one site consistently wetter than the other? How does soil moisture change from your to year? What do you think might cause these difference?





vwc <- read.csv("https://arcticdata.io/metacat/d1/mn/v2/object/urn%3Auuid%3A091841a5-ff1c-4465-8646-57d136085c61",
                header = T)


hd <- vwc[vwc$site=="hd",]
ld <- vwc[vwc$site=="ld",]

unique(hd$sensorZ)
#[1] 10 20 50

unique(ld$sensorZ)
#[1]  8 18 50

#low density
mean(.ld[ld$year==2016 & ld$doy<213 & ld$doy>181 & ld$sensorZ==8,4],na.rm = T)
#[1] 0.1666176
mean(ld[ld$year==2016 & ld$doy<213 & ld$doy>181 & ld$sensorZ==18,4],na.rm = T)
#[1] 0.2508058
mean(ld[ld$year==2016 & ld$doy<213 & ld$doy>181 & ld$sensorZ==50,4],na.rm = T)
#[1] 0.3776623
mean(ld[ld$year==2017 & ld$doy<213 & ld$doy>181 & ld$sensorZ==8,4],na.rm = T)
#[1] 0.2093858
mean(ld[ld$year==2017 & ld$doy<213 & ld$doy>181 & ld$sensorZ==18,4],na.rm = T)
#[1] 0.3137413
mean(ld[ld$year==2017 & ld$doy<213 & ld$doy>181 & ld$sensorZ==50,4],na.rm = T)
#[1] 0.3591001


#high density
mean(hd[hd$year==2016 & hd$doy<213 & hd$doy>181 & hd$sensorZ==10,4],na.rm = T)
#[1] 0.1783246
mean(hd[hd$year==2016 & hd$doy<213 & hd$doy>181 & hd$sensorZ==20,4],na.rm = T)
#[1] 0.313254
mean(hd[hd$year==2016 & hd$doy<213 & hd$doy>181 & hd$sensorZ==50,4],na.rm = T)
#[1] NaN
mean(hd[hd$year==2017 & hd$doy<213 & hd$doy>181 & hd$sensorZ==10,4],na.rm = T)
#[1] 0.1819509
mean(hd[hd$year==2017 & hd$doy<213 & hd$doy>181 & hd$sensorZ==20,4],na.rm = T)
#[1] 0.3353737
mean(hd[hd$year==2017 & hd$doy<213 & hd$doy>181 & hd$sensorZ==50,4],na.rm = T)
#[1] 0.347129