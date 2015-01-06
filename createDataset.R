#suppose you have a data file and you want to create a dataset of files
#each file having as name some of the variables and as text some other variable

#the path where your dataset is
setwd("H:\\.windows_settings\\Desktop\\stanford\\corpora\\Geodata\\")
#read a data source and saved it in a variable called "data"
data <- read.csv("H:\\.windows_settings\\Desktop\\stanford\\corpora\\Geodata\\image_tags2.csv")


for(i in 1: nrow(data)){ #looping each row

    name <- paste(data$userid[i], data$photoid[i], data$status[i], data$x[i], data$y[i], sep="_") #creates the name of the file using the userid, photid and status
    file.create(name) # create a file with the above name
    fileConn <- file(toString(name)) #open file connection
    writeLines(toString(data$annotation[i]), fileConn) #write in file
    close(fileConn) #close file
        
}
