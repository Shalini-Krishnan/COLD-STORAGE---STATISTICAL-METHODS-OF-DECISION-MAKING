#############COLD STORAGE DATSET################# 
###SET THE WORKING DIRECTORY### setwd("C:/Training/BACP DECEMBER PROJECT") ###IMPORTING THE COLD STORAGE DATASET### library(readr) library(readxl) library(dplyr) library(ggplot2) library(tigerstats) read.csv("Cold_Storage_Temp_Data.csv")->COLD_STORAGE   ###READING THE DATASET                                                                         INTO R names(COLD_STORAGE)####GIVES ALL THE VARIABLE NAMES 
## [1] "Season"      "Month"       "Date"        "Temperature" 
dim(COLD_STORAGE)###GIVES THE DIMENSION OF THE DATASET 
## [1] 365   4 
str(COLD_STORAGE)###GIVES THE STRUCTURE OF THE DATASET 
## 'data.frame':    365 obs. of  4 variables: 
##  $ Season     : Factor w/ 3 levels "Rainy","Summer",..: 3 3 3 3 3 3 3 3 3 3 ... 
##  $ Month      : Factor w/ 12 levels "Apr","Aug","Dec",..: 5 5 5 5 5 5 5 5 5 5 ... 
##  $ Date       : int  1 2 3 4 5 6 7 8 9 10 ... 
##  $ Temperature: num  2.4 2.3 2.4 2.8 2.5 2.4 2.8 2.3 2.4 2.8 ... 
summary(COLD_STORAGE)###GIVES THE 5 POINT SUMMARY 
##     Season        Month          Date        Temperature    
##  Rainy :122   Aug    : 31   Min.   : 1.00   Min.   :1.700   
##  Summer:120   Dec    : 31   1st Qu.: 8.00   1st Qu.:2.500   
##  Winter:123   Jan    : 31   Median :16.00   Median :2.900   
##               Jul    : 31   Mean   :15.72   Mean   :2.963   
##               Mar    : 31   3rd Qu.:23.00   3rd Qu.:3.300   
##               May    : 31   Max.   :31.00   Max.   :5.000   

##               (Other):179 
 anyNA(COLD_STORAGE)###CHECKS FOR ANY NA VALUES 
## [1] FALSE 
head(COLD_STORAGE)###GIVES FIRST 6 ROWS OF THE DATASET 
##   Season Month Date Temperature 
## 1 Winter   Jan    1         2.4 
## 2 Winter   Jan    2         2.3 
## 3 Winter   Jan    3         2.4 
## 4 Winter   Jan    4         2.8 
## 5 Winter   Jan    5         2.5 
## 6 Winter   Jan    6         2.4 
tail(COLD_STORAGE)###GIVES LAST 6 ROWS OF THE DATASET 
##     Season Month Date Temperature 
## 360 Winter   Dec   26         2.7 
## 361 Winter   Dec   27         2.7 
## 362 Winter   Dec   28         2.3 
## 363 Winter   Dec   29         2.6 
## 364 Winter   Dec   30         2.3 
## 365 Winter   Dec   31         2.9 
boxplot.stats(COLD_STORAGE$Temperature)$out###CHECKS FOR ANY OUTLIERS 
## [1] 5 5 
###UNIVARIATE ANALYSIS hist(COLD_STORAGE$Temperature,col="orange") 
boxplot(COLD_STORAGE$Temperature,horizontal = TRUE,col="gray",main="Temperatu re") qplot(COLD_STORAGE$Season) ####BIVARIATE ANALYSIS 
boxplot(COLD_STORAGE$Temperature~COLD_STORAGE$Season,horizontal = TRUE,col=c( "green","orange"),main="COMPARISION BOXPLOT") 
###OVERALL MEAN OF TEMPERATURE mean(COLD_STORAGE$Temperature)->MEAN cat("THE OVERALL MEAN TEMPERATURE IS:",round(MEAN,4)) ## THE OVERALL MEAN TEMPERATURE IS: 2.9627 
 

###OVERALL STANDARD DEVIATION OF TEMPERATURE sd(COLD_STORAGE$Temperature)->S.D. 
cat("THE OVERALL STANDARD DEVIATION OF THE TEMPERATURE IS:",round(S.D.,4)) 
## THE OVERALL STANDARD DEVIATION OF THE TEMPERATURE IS: 0.5086 
by(COLD_STORAGE,INDICES = Season,FUN =summary) 
## Season: Rainy 
##     Season        Month         Date        Temperature    
##  Rainy :122   Aug    :31   Min.   : 1.00   Min.   :1.700   
##  Summer:  0   Jul    :31   1st Qu.: 8.00   1st Qu.:2.500   
##  Winter:  0   Jun    :30   Median :16.00   Median :2.900   
##               Sep    :30   Mean   :15.75   Mean   :3.039   
##               Apr    : 0   3rd Qu.:23.00   3rd Qu.:3.300   
##               Dec    : 0   Max.   :31.00   Max.   :5.000   
##               (Other): 0                                   
## ------------------------------------------------------------  
## Season: Summer 
##     Season        Month         Date        Temperature    
##  Rainy :  0   Mar    :31   Min.   : 1.00   Min.   :2.500   
##  Summer:120   May    :31   1st Qu.: 8.00   1st Qu.:2.800   
##  Winter:  0   Apr    :30   Median :15.50   Median :3.200   
##               Feb    :28   Mean   :15.53   Mean   :3.153   
##               Aug    : 0   3rd Qu.:23.00   3rd Qu.:3.400   
##               Dec    : 0   Max.   :31.00   Max.   :4.100   
##               (Other): 0                                   
## ------------------------------------------------------------  
## Season: Winter 
##     Season        Month         Date        Temperature    
##  Rainy :  0   Dec    :31   Min.   : 1.00   Min.   :1.900   
##  Summer:  0   Jan    :31   1st Qu.: 8.00   1st Qu.:2.400   
##  Winter:123   Oct    :31   Median :16.00   Median :2.600   
##               Nov    :30   Mean   :15.88   Mean   :2.701   
##               Apr    : 0   3rd Qu.:23.50   3rd Qu.:2.900   ##               Aug    : 0   Max.   :31.00   Max.   :3.900   
##               (Other): 0 

 
###IMPORTING THE MARCH DATASET read.csv("Cold_Storage_Mar2018.csv")->TEMPORARY_SET summary(TEMPORARY_SET) 
##     Season   Month         Date       Temperature    
##  Summer:35   Feb:18   Min.   : 1.0   Min.   :3.800   
##              Mar:17   1st Qu.: 9.5   1st Qu.:3.900   
##                       Median :14.0   Median :3.900   
##                       Mean   :14.4   Mean   :3.974   
##                       3rd Qu.:19.5   3rd Qu.:4.100   
##                       Max.   :28.0   Max.   :4.600 
####HYPOTHESIS TESTING ###H0=3.9,H1<3.9 sd(TEMPORARY_SET$Temperature) 
## [1] 0.159674 
t.test(TEMPORARY_SET$Temperature,mu=3.9,alternative = "less",conf.level = 0.9 ) 
##  
##  One Sample t-test 
##  
## data:  TEMPORARY_SET$Temperature 
## t = 2.7524, df = 34, p-value = 0.9953 
## alternative hypothesis: true mean is less than 3.9 
## 90 percent confidence interval: 
##     -Inf 4.00956 
## sample estimates: 
## mean of x  
##  3.974286 
 
#############END############################################## 

