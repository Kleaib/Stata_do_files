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
rename v_299 pup_teach
rename v_315 prim_enr
rename v_326 youth_noteduc
rename v_349 teach_trng
rename v_374 unemp_youth

*Add Label to variables
label variable acc_elect "Access to electricity (% of population)"
label variable fert_rate "Adolescent fertility rate (births per 1,000 women ages 15-19)"
label variable out_school_prim "Children out of school, primary"
label variable out_school_fem "Children out of school, primary, female"
label variable comp_educ "Compulsory education, duration (years)"
label variable GDP_capita "GDP per capita (constant 2010 US$)"
label variable int_use "Individuals using the Internet (% of population)"
label variable lit_rate "Literacy rate, youth (ages 15-24), gender parity index (GPI)"
label variable lit_rate_fem "Literacy rate, youth female (% of females ages 15-24)"
label variable lit_rate_male "Literacy rate, youth male (% of males ages 15-24)"
label variable lit_rate_tot "Literacy rate, youth total (% of people ages 15-24)"
label variable pov_index "Multidimensional poverty index (scale 0-1)"
label variable prim_rate_fem "Primary completion rate, female (% of relevant age group)"
label variable prim_rate_male "Primary completion rate, male (% of relevant age group)"
label variable prim_rate_tot "Primary completion rate, total (% of relevant age group)"
label variable pup_teach "Pupil-teacher ratio, primary"
label variable prim_enr "School enrollment, primary (gross), gender parity index (GPI)"
label variable youth_noteduc "Share of youth not in education, employment or training, total (% of youth population)"
label variable teach_trng "Trained teachers in lower secondary education (% of total teachers)"
label variable unemp_youth "Unemployment, youth total (% of total labor force ages 15-24) (modeled ILO estimate)"

*Turn GDP in log GDP
gen logGDP = ln(GDP_capita)
*Drop missing values
drop if logGDP==.

*Save dta file
save "C:\Users\Ibrahimi_Klea\Desktop\SDG\SDG_data_2.dta"