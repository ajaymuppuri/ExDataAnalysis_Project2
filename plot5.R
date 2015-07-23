# Load the NEI & SCC data frames.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset coal combustion related NEI data
vehicleRelated <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehicleSCC <- SCC[vehicleRelated,]$SCC
vehicleNEI <- NEI[NEI$SCC %in% vehicleSCC,]
baltimoreVehiclesNEI <- vehicleNEI[vehicleNEI$fips=="24510",]

png("plot5.png",width=480,height=480,units="px",bg="transparent")

library(ggplot2)

ggp <- ggplot(baltimoreVehiclesNEI,aes(factor(year),Emissions)) +
    geom_bar(stat="identity",fill="orange",width=0.75) +
    theme_bw() +  guides(fill=FALSE) +
    labs(x="year", y=expression("Total PM"[2.5]*" Emission")) + 
    labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions Across US from 1999-2008"))

print(ggp)

dev.off()
