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

plot(df$DateTime,df$Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering")
lines(df$DateTime,df$Sub_metering_2, type = "l", col = "red")
lines(df$DateTime,df$Sub_metering_3, type = "l", col = "blue")
legend("topright", colnames(df[,7:9]), col=c("black", "red", "blue"), lwd=c(1,1,1))
