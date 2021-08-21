/******************************************************
					Applied Economics
				  Problem Set #2 - 2021
				  Ordinary Least Squares
*******************************************************/
log using week2, replace

global main "\Users\valul\OneDrive\Documents\UdeSA 2021\Semestre Primavera\Economía Aplicada"
global output "$main/output"
global input "$main/input"


use China_Data.dta, clear


*1) Present a table with summary statistics of the following variables: village_pop, income_pc, subsidy_rate, poor_housing_rate, poor_reg_rate, disability_rate, gov_officials, high_gov_quality, mid_gov_quality, low_gov_quality, ag_rate, business_income_pc, fiscal_rev_pc, fiscal_exp_pc, col_revenue_pc, trained_labor_rate, safe_water_rate, computer_rate, med_ins_rate, and enroll_rate. 

*Replicate it twice: using esttab and frmttable. Add labels to the variables (do not change them by editing the Word/Tex file). Suggestion: when using esttab, use “wide” as an option.



*Table using esttab 

estpost tabstat village_pop income_pc subsidy_rate poor_housing_rate poor_reg_rate disability_rate gov_officials high_gov_quality mid_gov_quality low_gov_quality ag_rate business_income_pc fiscal_rev_pc fiscal_exp_pc col_revenue_pc trained_labor_rate safe_water_rate computer_rate med_ins_rate enroll_rate, statistics(count mean sd) columns(statistics) 

label variable village_pop "Village population"
label variable income_pc "Rural per capita net income (yuan)"
label variable subsidy_rate "Subsidy rate (per 1,000)"
label variable poor_housing_rate "Poor housing (per 100 HHs)"
label variable poor_reg_rate "Registered poor households (per 100 HHs)"
label variable disability_rate "Disability rate (per 1,000)"
label variable gov_officials "Number of village officials"
label variable high_gov_quality "Village officials with high school and above education (percent)"
label variable mid_gov_quality "Village officials with middle school education (percent)"
label variable low_gov_quality "Village officials with primary school and below education (percent)"
label variable ag_rate "Agricultural households (per 100 households)"
label variable business_income_pc "Per capita business revenue (yuan)"
label variable fiscal_rev_pc "Village government fiscal revenue per capita (yuan)"
label variable fiscal_exp_pc "Village government fiscal expenditure per capita (yuan)"
label variable col_revenue_pc "Government collective revenue (yuan)"
label variable trained_labor_rate "Trained laborers (per 100)"
label variable safe_water_rate "HHs with tap water access (per 100 HHs)"
label variable computer_rate "HHs with computers (per 100 HHs)"
label variable med_ins_rate "HHs with rural cooperative medical insurance (100 HHs)"
label variable enroll_rate "School enrollment rate for children aged 7-13 (percent)"

esttab . using TablaA.rtf, wide nonumber nonote noobs cells("count mean(fmt(0)) sd(fmt(0))") title("TABLE 1 - Summary Statistics of NFS Villages") collabels("Observations" "Mean" "Standard Deviation") addnotes(Note: The statistics are based on our analysis of 255 villages) label replace 



* Table using frmrttable  
tabstat village_pop income_pc subsidy_rate poor_housing_rate poor_reg_rate disability_rate gov_officials high_gov_quality mid_gov_quality low_gov_quality ag_rate business_income_pc fiscal_rev_pc fiscal_exp_pc col_revenue_pc trained_labor_rate safe_water_rate computer_rate med_ins_rate enroll_rate, save statistics(count mean sd) columns(statistics)

matrix Tabla1=r(StatTotal)
mat list Tabla1

mat Tabla1=Tabla1'
mat list Tabla1
 
frmttable using Tabla2.rtf, statmat(Tabla1) sdec(0,0,0) ctitles("Variables", "Observations", "Mean", "Standard deviation") title("TABLE 1 - Summary Statistics of NFS Villages") rtitles("Village population"\"Rural per capita net income (yuan)"\"Subsidy rate (per 1,000)"\"Poor housing (per 100 HHs)"\"Registered poor households (per 100 HHs)"\"Disability rate (per 1,000)"\"Number of village officials"\"Village officials with high school and above education (percent)"\"Village officials with middle school education (percent)"\"Village officials with primary school and below education (percent)"\"Agricultural households (per 100 households)"\"Per capita business revenue (yuan)"\"Village government fiscal revenue per capita (yuan)"\"Village government fiscal expenditure per capita (yuan)"\"Government collective revenue (yuan)"\"Trained laborers (per 100)"\"HHs with tap water access (per 100 HHs)"\"HHs with computers (per 100 HHs)"\"HHs with rural cooperative medical insurance (100 HHs)"\"School enrollment rate for children aged 7-13 (percent)") note("Note: The statistics are based on our analysis of 255 villages") replace




*2)

*Esta mal esto, se debria agregar todas las regresiones en un mismo cuadro como en la pag 204 y 205 del paper, pero no se bien como hacerlo. 


reg cgvo poor_housing_rate 
outreg2 using regresion_poor.tex, tex replace dec(3) title("Table 3 - Regression") ctitle("CGVO")  
*comentar 

reg cgvo poor_housing_rate precipitation temperature
outreg2 using regresion_poorprecip.tex, tex replace dec(3) title("Table 4 - Regression") ctitle("CGVO")  
*comentar 

reg cgvo disability_rate
outreg2 using regresion_disab.tex, tex replace dec(3) title("Table 4 - Regression") ctitle("CGVO")  
*comentar 

reg cgvo disability_rate precipitation temperature
outreg2 using regresion_disabprec.tex, tex replace dec(3) title("Table 5 - Regression") ctitle("CGVO")  
*comentar 

reg cgvo subsidy_rate 
outreg2 using regresion_sub.tex, tex replace dec(3) title("Table 6 - Regression") ctitle("CGVO")  
*comentar

reg cgvo subsidy_rate precipitation temperature
outreg2 using regresion_disabprec.tex, tex replace dec(3) title("Table 7 - Regression") ctitle("CGVO")
*comentar 














