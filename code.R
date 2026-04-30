### Submitted by Satoshi Koiso, Zaw Wai Yan Bo and Pyone Yadanar Paing
### Last updated by 5/1/2026
## Load libraries 
library(haven)
library(data.table)
library(dplyr)
library(ggplot2)

### Data Preparation and cleaning
## Datasets are downloaded from website below. 
# https://wwwn.cdc.gov/nchs/nhanes/continuousnhanes/default.aspx?Cycle=2021-2023
## Read datasets
a1c <- read_xpt("GHB_L.xpt")
demo <- read_xpt("DEMO_L.xpt")

# merge datasets
nhanes <- merge(merge(a1c, demo, by = "SEQN", all = TRUE),
                demo, by = "SEQN", all = TRUE)
nhanes_dt <- setDT(nhanes)
View(nhanes_dt)
# Create average BP

# Limit the dataset to 12+ years old because HbA1c is measured 12+ years
nhanes_dt <- nhanes_dt[RIDAGEYR >= 12]
