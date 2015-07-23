# Reading the original data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(ggplot2)
library("gridExtra")
library(plyr)

# Calculate data for baltimore
NEIBaltimore <- NEI[NEI$fips=="24510",]

# Calculate the means of the emissions rather than sum, since we could have different 
# number of rows for each year
aggMean <- aggregate(Emissions ~ type+year,NEIBaltimore, mean)
png("plot3.png",width=480,height=480,bg="transparent")

p1 <- ggplot(data=aggMean)  + geom_line(aes(year,Emissions), subset=.(type %in% c("NONPOINT")), color="blue") +  ggtitle("Total PM2.5 Emissions From All Sources for Baltimore for Non-Point")

p2 <- ggplot(data=aggMean)  + geom_line(aes(year,Emissions), subset=.(type %in% c("ON-ROAD")), color="green") +  ggtitle("Total PM2.5 Emissions From All Sources for Baltimore for On-Road")

p3 <- ggplot(data=aggMean)  + geom_line(aes(year,Emissions), subset=.(type %in% c("POINT")), color="red") +  ggtitle("Total PM2.5 Emissions From All Sources for Baltimore for Point")

p4 <- ggplot(data=aggMean)  + geom_line(aes(year,Emissions), subset=.(type %in% c("NON-ROAD")), color="orange") +  ggtitle("Total PM2.5 Emissions From All Sources for Baltimore for Non-Road")
grid.arrange(p1,p2,p3,p4,ncol=2)
dev.off();