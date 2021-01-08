clear
*After reshaping the data, we will continue with other changes such as keeping only some of the varibles, transforming them, and keeping only the needed observations

*Open the previous dta file
use "C:\Users\Ibrahimi_Klea\Desktop\SDG\SDG_data_1.dta" 

*In our analysis we will need data only for years after 1999
*Year 1990 is expressed as 5 in our dataset we can fix it by using replace
replace year = year+1985

*Using forloops we can drop the unnecessary years data
forvalues i=1990/1999{
	drop if year == `i'
}
 
*rename variables
rename v_2 acc_elect
rename v_15 fert_rate
rename v_44 out_school_prim
rename v_45 out_school_fem
rename v_58 comp_educ
rename v_133 GDP_capita
rename v_161 int_use
rename v_176 lit_rate
rename v_177 lit_rate_fem
rename v_178 lit_rate_male
rename v_179 lit_rate_tot
rename v_211 pov_index
rename v_285 prim_rate_fem
rename v_286 prim_rate_male
rename v_287 prim_rate_tot
rename v_289 gov_exp
rename v_299 pup_teach
rename v_315 prim_enr
rename v_326 youth_noteduc
rename v_349 teach_trng
rename v_374 unemp_youth

*Turn GDP in log GDP
gen logGDP = ln(GDP_capita)
*Drop missing values
drop if logGDP==.

*Declaring our data is panel
encode countryname, gen(country)
xtset country year

*Save dta file
save "C:\Users\Ibrahimi_Klea\Desktop\SDG\SDG_data_2.dta"