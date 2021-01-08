*In this last do file, we will run regressions, create graphs and save it
*Analyze the factors which affect literacy rate in youth

*First open the dta file
use "C:\Users\Ibrahimi_Klea\Desktop\SDG\SDG_data_2.dta" 

*Declaring our data is panel
encode countryname, gen(country)
xtset country year

*Create and save graphs
graph matrix fert_rate GDP_capita lit_rate
graph save "Graph" "C:\Users\Ibrahimi_Klea\Desktop\SDG\scattermatrix_1.gph"
histogram lit_rate
graph save "Graph" "C:\Users\Ibrahimi_Klea\Desktop\SDG\hist_litrate.gph"

*to save regressions output first outreg2 should be installed
ssc install outreg2

*OLS regressions
reg lit_rate GDP_capita fert_rate out_school_prim unemp_youth
outreg2 using OLS.xls
reg lit_rate_fem GDP_capita fert_rate out_school_prim unemp_youth
outreg2 using OLSf.xls
reg lit_rate_male GDP_capita fert_rate out_school_prim unemp_youth
outreg2 using OLSm.xls

*Fixed effects
xtreg lit_rate GDP_capita fert_rate out_school_prim unemp_youth, fe
outreg2 using OLS_fe.xls
xtreg lit_rate_fem GDP_capita fert_rate out_school_prim unemp_youth, fe
outreg2 using OLSf_fe.xls
xtreg lit_rate_male GDP_capita fert_rate out_school_prim unemp_youth, fe
outreg2 using OLSm_fe.xls

*install stata package
ssc install insheetjson
ssc install libjson
ssc install geocode
*unlock the comment to try the package (Warning:it takes a lot of time)
*geocode, state(countryname)

*Save dta file
save "C:\Users\Ibrahimi_Klea\Desktop\SDG\SDG_data_3.dta"