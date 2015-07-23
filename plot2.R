# Reading the original data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# Calculate data for baltimore
NEIBaltimore <- NEI[NEI$fips=="24510",]

# Calculate the means of the emissions rather than sum, since we could have different 
# number of rows for each year
aggMean <- aggregate(Emissions ~ year,NEIBaltimore, mean)
png("plot2.png",width=480,height=480,bg="transparent")

barplot(aggMean$Emissions,names.arg=aggTotals$year,
        xlab="Year",ylab="PM2.5 Emissions for Baltimore", col="blue",
        main="Total PM2.5 Emissions From All Sources for Baltimore"
)

dev.off();