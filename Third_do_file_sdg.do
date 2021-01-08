*In this last do file, we will run regressions, create graphs and save it

*First open the dta file
use "C:\Users\Ibrahimi_Klea\Desktop\SDG\SDG_data_2.dta" 

*Graphs
*save graphs

*OLS regressions or Fixed effects
*save tables

*install stata package
ssc install insheetjson
ssc install libjson
ssc install geocode

geocode, state(countryname)

*Save dta file
save "C:\Users\Ibrahimi_Klea\Desktop\SDG\SDG_data_3.dta"