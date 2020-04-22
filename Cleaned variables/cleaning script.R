#import required libraries
library(stringr)
library(readxl)
library("xlsx")
library("dplyr")

#set working directory
setwd("C:/Users/Stan/Downloads/OZP/results/Extracted variables Excel/")

#import sheet
paymentsPC_noTOR <- read_excel("paymentsPC_noTOR.xlsx")

#extract numeric values of each variable and save it
paymentsPC_noTOR$PaymentIndex <- as.numeric(str_extract_all(paymentsPC_noTOR$PaymentIndex, "[0-9]+"))
paymentsPC_noTOR$AttemptTime <- as.numeric(str_extract_all(paymentsPC_noTOR$AttemptTime, "[0-9]+"))
paymentsPC_noTOR$ResolveTime <- as.numeric(str_extract_all(paymentsPC_noTOR$ResolveTime, "[0-9]+"))
paymentsPC_noTOR$TotalFeesMilisatoshis <- as.numeric(str_extract_all(paymentsPC_noTOR$TotalFeesMilisatoshis, "[0-9]+"))
paymentsPC_noTOR$TransactionValue <- as.numeric(str_extract_all(paymentsPC_noTOR$TransactionValue, "[0-9]+"))

#create new variable 
paymentsPC_noTOR <- mutate(paymentsPC_noTOR, TransactionSpeedNS = ResolveTime - AttemptTime)

#convert to miliseconds by dividing by 1000000 and rouding off by 4 digits
paymentsPC_noTOR <- round(mutate(paymentsPC_noTOR, TransactionSpeedMS = TransactionSpeedNS / 1000000))

#save dataframe as .xlsx
write.xlsx(paymentsPC_noTOR, "paymentsPC_noTOR_cleaned.xlsx")

#repeat the above
paymentsPi_noTOR <- read_excel("paymentsPi_noTOR.xlsx")
paymentsPi_noTOR$PaymentIndex <- as.numeric(str_extract_all(paymentsPi_noTOR$PaymentIndex, "[0-9]+"))
paymentsPi_noTOR$AttemptTime <- as.numeric(str_extract_all(paymentsPi_noTOR$AttemptTime, "[0-9]+"))
paymentsPi_noTOR$ResolveTime <- as.numeric(str_extract_all(paymentsPi_noTOR$ResolveTime, "[0-9]+"))
paymentsPi_noTOR$TotalFeesMilisatoshis <- as.numeric(str_extract_all(paymentsPi_noTOR$TotalFeesMilisatoshis, "[0-9]+"))
paymentsPi_noTOR$TransactionValue <- as.numeric(str_extract_all(paymentsPi_noTOR$TransactionValue, "[0-9]+"))
paymentsPi_noTOR <- mutate(paymentsPi_noTOR, TransactionSpeedNS = ResolveTime - AttemptTime)
paymentsPi_noTOR <- round(mutate(paymentsPi_noTOR, TransactionSpeedMS = TransactionSpeedNS / 1000000))
write.xlsx(paymentsPi_noTOR, "paymentsPi_noTOR_cleaned.xlsx")

#repeat the above
paymentsPC_TOR <- read_excel("paymentsPC_TOR.xlsx")
paymentsPC_TOR$PaymentIndex <- as.numeric(str_extract_all(paymentsPC_TOR$PaymentIndex, "[0-9]+"))
paymentsPC_TOR$AttemptTime <- as.numeric(str_extract_all(paymentsPC_TOR$AttemptTime, "[0-9]+"))
paymentsPC_TOR$ResolveTime <- as.numeric(str_extract_all(paymentsPC_TOR$ResolveTime, "[0-9]+"))
paymentsPC_TOR$TotalFeesMilisatoshis <- as.numeric(str_extract_all(paymentsPC_TOR$TotalFeesMilisatoshis, "[0-9]+"))
paymentsPC_TOR$TransactionValue <- as.numeric(str_extract_all(paymentsPC_TOR$TransactionValue, "[0-9]+"))
paymentsPC_TOR <- mutate(paymentsPC_TOR, TransactionSpeedNS = ResolveTime - AttemptTime)
paymentsPC_TOR <- round(mutate(paymentsPC_TOR, TransactionSpeedMS = TransactionSpeedNS / 1000000))
write.xlsx(paymentsPC_TOR, "paymentsPC_TOR_cleaned.xlsx")