data <-read.csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv")
head(data)
View(data)
rownames(data)
colnames(data)
str(data)
metadata <- data[,1:4]
metadata$Sum_ills <- rowSums(data[, -(1:4)])
metadata$Mean_ills <- apply(X = data[, -(1:4)], # Данные
                                     MARGIN = 1, # Измерения
                                     FUN = mean) # Функция
metadata$Std_ills <- apply(X = data[, -(1:4)], # Данные
                                    MARGIN = 1, # Измерения
                                    FUN = sd) # Функция
metadata$Country.Province <- paste(metadata$Country.Region, metadata$Province.State, sep = ":")
View(metadata)
metadata <- metadata[, c(8, 3:7)]
View(metadata)
data.for_num_6 <- t(data)
data.for_num_6 <- data.for6[-c(1:4),]
colnames(data.for_num_6) <- metadata[,1]
View(data.for_num_6)
rownames(data.for_num_6) <- format(as.Date(substring(rownames(data.for_num_6),2), "%m.%d.%y"), "%Y-%m-%d")
View(data.for_num_6)
if (dir.exists("data_output")){
  write.csv(metadata, "data_output/data_output.csv")
} else {
  dir.create("data_output", showWarnings = FALSE)
  write.csv(metadata, "data_output/data_output.csv")
}
install.packages("xlsx")
library(xlsx)
if (dir.exists("data_output")){
  write.xlsx(metadata, "data_output/data_output.xlsx")
} else {
  dir.create("data_output", showWarnings = FALSE)
  write.xlsx(metadata, "data_output/data_output.xlsx")
}
if (dir.exists("data_output")){
  write.table(metadata, "data_output/data_output.txt")
} else {
  dir.create("data_output", showWarnings = FALSE)
  write.table(metadata, "data_output/data_output.txt")
}
#write.csv(metadata, "data_output/data_output.csv")
