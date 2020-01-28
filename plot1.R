#Load the given dataset
my_data = read.table("household_power_consumption.txt",header = TRUE, sep = ";",na.strings="?")
str(my_data)
#Remove the NA rows
my_data=na.omit(my_data)
#Convert the format of the Date column from factor to date
my_data$Date=as.Date( my_data$Date, format="%d/%m/%Y" )
str(my_data)
#Keep only data of only 1st Feb 2007 and 2nd Feb 2007
df=subset(my_data,my_data$Date>=as.Date("2007-02-01") & my_data$Date<=as.Date("2007-02-02"))
#Create a new DateTime column
df$DateTime=strptime(paste(df$Date, df$Time), "%Y-%m-%d %H:%M:%S")
str(df)
hist(df$Global_active_power, col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)")

