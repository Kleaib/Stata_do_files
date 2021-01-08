clear

*First Do-file
*Import the csv file to get data needed
import delimited "C:\Users\Ibrahimi_Klea\Desktop\SDG\SDGData.csv", varnames(1) bindquotes(strict) encoding(UTF-8) clear 

*To prepare the data for our analysis we need to reshape it
*Transform one variable from string to integer
encode indicatorname, gen(indicator)
drop indicatorname

*Keeping only the variables needed for the analysis
keep if indicator==2 | indicator==15 | indicator==44 | indicator==45 |indicator==58 | indicator==133 | indicator==161 | indicator==176 | indicator==177 | indicator==178 | indicator==179 | indicator==211 | indicator== 285| indicator== 286| indicator== 287| indicator==299 | indicator== 315| indicator== 326 | indicator== 349 | indicator== 374

*We need to drop duplicated data
duplicates drop countryname indicator, force
drop countrycode indicatorcode

*reshape from wide to long
reshape long v, i(countryname indicator) j(year)
rename v v_
*the final reshape-now our data will look the way we wanted
reshape wide v_, i(countryname year) j(indicator)

*Save dataset
save "C:\Users\Ibrahimi_Klea\Desktop\SDG\SDG_data_1.dta"