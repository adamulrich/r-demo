# load tidyverse
library(tidyverse)

# read the csv file into a data frame
df <-read.csv("life-expectancy.csv")

# order data by year
df <- df %>% arrange(Code, Year) 

#group by Code, and remove any data without codes
df <- df %>% group_by(df$Code) %>% filter(Code != "") 

# create new data frame that calculates the deltas
df <- data.frame(Entity = df$Entity, 
                    Code = df$Code, 
                    Year = df$Year, 
                    LifeExpectancy = df$Life.expectancy..years.)

#add the Next Year Column
df <- transform(df, NextYear = c(Year[-1], NA))

#add the NextLifeExpectancy Column
df <- transform(df, NextLifeExpectancy = c(LifeExpectancy[-1], NA))

#filter on Year = NextYear -1
df <- df %>% filter(Year +1 == NextYear)

#calculate deltas
df <- transform(df, Delta = (NextLifeExpectancy - LifeExpectancy))

# order the deltas smallest to largest. This will show the most negative number, which is what we are looking for
ordered_deltas <- df %>% arrange(df$Delta) %>% slice(1:100)

head(ordered_deltas,25)

#show pie chart for locations, top  70
pie_data = as.data.frame(table(ordered_deltas$Entity))

#show pie chart
pie(pie_data$Freq, paste(pie_data$Var1," - ",pie_data$Freq),,1)

# read in historical data
library(readxl)
historical_data <- read_excel("Historical Data.xlsx")

#create new dataset with historical context
library(dplyr)
df2 <- ordered_deltas %>% inner_join( historical_data, 
                              by=c('Code'='Code', 
                                   'Year' = 'Year'))

df2 <- df2[,c("Country", "NextYear", "Delta", "Event Type", "Event")]
head(df2,25)

#create pie chart data
event_pie_data = as.data.frame(table(df2$`Event Type`))

# show pie chart
pie(event_pie_data$Freq, paste(event_pie_data$Var1," - ",event_pie_data$Freq),,1)

# create table data
counts = table(df2$NextYear)

barplot(counts, main="Years with the most top 100 impacts to life expectancy",
        xlab="Year", col=c("darkblue","red"))

table_data <- df2 %>% arrange(NextYear)
head(table_data, 100)

