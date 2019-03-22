

c <- read.csv("https://arcticdata.io/metacat/d1/mn/v2/object/urn%3Auuid%3Ae83680e9-0579-4b5d-87df-0665dc27cbc0",header = T,skip = 1,na.strings = "N/A")


# plot CO2 flux vs. PAR to examine light response curve
plot(c$PAR.umol.m2.s.,c$CO2.flux..umol.m2.s.)

flux <- as.data.frame(cbind(c$PAR.umol.m2.s.,-c$CO2.flux..umol.m2.s.))
names(flux) <- c("par","co2")


test <- nls(co2~((Jmax*par*Amax)/(Jmax*par+Amax)),data = flux,
            start = list(Amax = 1,Jmax = 1))
            
# Amax = maximum rate of photosynthesis
# K = light extinction coefficient
# b = Amax/E, where E = light use efficiency
# 3.5 = LAI for our stand

par <- c$PAR.umol.m2.s.
co2 <- -c$CO2.flux..umol.m2.s.


# plot CO2 flux vs. PAR to examine light response curve
plot(c$Air.temperature,c$CO2.flux..umol.m2.s.,
     ylim = c(10,-7))

# plot dark CO2 flux vs air temp
plot(c$Soil.temperature.at.site.1[c$PAR.umol.m2.s.<30],
     c$CO2.flux..umol.m2.s.[c$PAR.umol.m2.s.<30])

plot(c$Latent.heat.flux.W.m2.,-c$CO2.flux..umol.m2.s.)
