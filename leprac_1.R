Firms <- Ornstein #1
View(Firms) #2
print(nrow(Firms)) #3
print(ncol(Firms))
print(colnames(Firms))
sum(is.na.data.frame(Firms))
print(Firms[Firms$assets >= 10000 & Firms$assets <= 20000,]) #4.1
print(Firms[Firms$interlocks <= 30,]) #4.2
print(Firms[Firms$sector == "TRN" & Firms$nation == "CAN",]) #4.3
Firms$log_assets <- log(Firms$assets) #5
hist(Firms$assets, breaks = 30) #6
#7 нечего удалять, нет пропущенных значений
library(foreign)
write.dta(Firms, "Firms.dta")
