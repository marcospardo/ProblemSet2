/******************************************************
					Applied Economics
				  Problem Set #2 - 2021
				  Ordinary Least Squares
*******************************************************/

global main "\Users\emery\OneDrive\Documents\UdeSA 2021\Semestre Primavera\Economía Aplicada"
global output "$main/output"
global input "$main/input"

cd "C:\Users\emery\OneDrive\Documents\UdeSA 2021\Semestre Primavera\Economía Aplicada\Tutorial 2\input" 
					 
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

esttab . using TablaA.tex, wide nonumber nonote noobs cells("count(fmt(%9.0fc)) mean(fmt(%9.0fc)) sd(fmt(%9.0fc))") title("TABLE 1 - Summary Statistics of NFS Villages") collabels("Observations" "Mean" "Standard Deviation") addnotes(Note: The statistics are based on our analysis of 255 villages) label replace 



* Table using frmrttable  
tabstat village_pop income_pc subsidy_rate poor_housing_rate poor_reg_rate disability_rate gov_officials high_gov_quality mid_gov_quality low_gov_quality ag_rate business_income_pc fiscal_rev_pc fiscal_exp_pc col_revenue_pc trained_labor_rate safe_water_rate computer_rate med_ins_rate enroll_rate, save statistics(count mean sd) columns(statistics)

matrix Tabla1=r(StatTotal)
mat list Tabla1

mat Tabla1=Tabla1'
mat list Tabla1
 
frmttable using Tabla2.tex, statmat(Tabla1) sdec(0,0,0) ctitles("Variables", "Observations", "Mean", "Standard deviation") title("TABLE 1 - Summary Statistics of NFS Villages") rtitles("Village population"\"Rural per capita net income (yuan)"\"Subsidy rate (per 1,000)"\"Poor housing (per 100 HHs)"\"Registered poor households (per 100 HHs)"\"Disability rate (per 1,000)"\"Number of village officials"\"Village officials with high school and above education (percent)"\"Village officials with middle school education (percent)"\"Village officials with primary school and below education (percent)"\"Agricultural households (per 100 households)"\"Per capita business revenue (yuan)"\"Village government fiscal revenue per capita (yuan)"\"Village government fiscal expenditure per capita (yuan)"\"Government collective revenue (yuan)"\"Trained laborers (per 100)"\"HHs with tap water access (per 100 HHs)"\"HHs with computers (per 100 HHs)"\"HHs with rural cooperative medical insurance (100 HHs)"\"School enrollment rate for children aged 7-13 (percent)") note("Note: The statistics are based on our analysis of 255 villages") tex replace



*2) For registered poor households, people with disabilities, subsidized population, and poor housing variables in levels run an OLS regression against “CGVO”. For each variable, run a simple regression and then a regression including precipitation and temperature as controls. Report the output using the command outreg2. Finally, repeat the analysis using a log-lin specification. Analyze qualitatively and quantitatively (sign and statistical significance) each coefficient.

*Al igual que en el paper, subdividimos en dos tablas separadas las regresiones contra la variable cgvo y los controles: por un lado, las correspondientes a las variables de tasa registrada de pobres y a la disability rate (con sus respectivos casos en logaritmos); por otro lado, hacemos lo mismo para las variables dependientes de tasa de subsidios y tasa de casas pobres.

*Tabla 2.1:

reg poor_reg_rate cgvo
outreg2 using regresions.tex, replace dec(3) 
*comentar 

reg poor_reg_rate cgvo precipitation temperature
outreg2 using regresions.tex, dec(3) append   
*comentar 

reg disability_rate cgvo
outreg2 using regresions.tex, dec(3) append
*comentar 

reg disability_rate cgvo precipitation temperature
outreg2 using regresions.tex, dec(3) title("Table 2.1—CGVO and Pro-poor Policies: Registration Effect") append 
*comentar 


*Tabla 2.2:

reg l_poor_reg_rate cgvo
outreg2 using regresions1.tex, replace dec(3) append
*comentar 

reg l_poor_reg_rate cgvo precipitation temperature
outreg2 using regresions1.tex, dec(3) append  

reg l_disability_rate cgvo
outreg2 using regresions1.tex, dec(3) append 
*comentar 

reg l_disability_rate cgvo precipitation temperature
outreg2 using regresions1.tex, dec(3) title("Table 2.1—CGVO and Pro-poor Policies: Registration Effect (logs)")
*comentar 

*Tabla 2.3:

reg subsidy_rate cgvo
outreg2 using regresions2.tex, dec(3) replace
*comentar

reg subsidy_rate cgvo precipitation temperature
outreg2 using regresions2.tex, dec(3) title("Table 7 - Regression") ctitle("CGVO") append
*comentar 

reg poor_housing_rate cgvo
outreg2 using regresions2.tex, dec(3) title("Table 3 - Regression") ctitle("CGVO") append
*comentar 

reg poor_housing_rate cgvo precipitation temperature
outreg2 using regresions2.tex, dec(3) title("Table 2.2—CGVO and Subsidies") append

*Tabla 2.4:

reg l_subsidy_rate cgvo
outreg2 using regresions3.tex, dec(3) replace
*comentar

reg l_subsidy_rate cgvo precipitation temperature
outreg2 using regresions3.tex, dec(3) title("Table 7 - Regression") ctitle("CGVO") append
*comentar 

reg l_poor_housing_rate cgvo
outreg2 using regresions3.tex, dec(3) title("Table 3 - Regression") ctitle("CGVO") append
*comentar 

reg l_poor_housing_rate cgvo precipitation temperature
outreg2 using regresions3.tex, dec(3) ctitle("Subsidized population (per 1000, log)" "Poor housing (per 100 households, log)") title("Table 2.2—CGVO and Subsidies (logs)") append

*comentar

*(Para repetir el analisis con un modelo log-lin, lo que hicimos fue generar una variable que estuviese en logaritmos para cada variable explicada, y repetimos el mismo procedimiento usando esa variable como la dependiente).


