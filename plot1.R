# Reading the original data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Calculate the means of the emissions rather than sum, since we could have different 
# number of rows for each year
aggMean <- aggregate(Emissions ~ year,NEI, mean)
png("plot1.png",width=480,height=480,bg="transparent")

barplot(aggMean$Emissions,names.arg=aggTotals$year,
     xlab="Year",ylab="PM2.5 Emissions", col="blue",
     main="Total PM2.5 Emissions From All US Sources"
    )

dev.off();