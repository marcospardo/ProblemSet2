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


* Another option
estpost tabstat village_pop income_pc subsidy_rate poor_housing_rate poor_reg_rate disability_rate gov_officials high_gov_quality mid_gov_quality low_gov_quality ag_rate business_income_pc fiscal_rev_pc fiscal_exp_pc col_revenue_pc trained_labor_rate safe_water_rate computer_rate med_ins_rate enroll_rate, statistics(mean sd) columns(statistics)

esttab . using PS2_1.tex, replace frag main(mean) aux(sd) nostar unstack noobs nonote label wide

esttab . using example.rtf, replace main(mean) aux(sd) nostar unstack noobs nonote label wide

* Summary Statistics tables  
tabstat village_pop income_pc subsidy_rate poor_housing_rate poor_reg_rate disability_rate gov_officials high_gov_quality mid_gov_quality low_gov_quality ag_rate business_income_pc fiscal_rev_pc fiscal_exp_pc col_revenue_pc trained_labor_rate safe_water_rate computer_rate med_ins_rate enroll_rate, save statistics(N mean sd) columns(statistics)

* Save matrix
matrix Tabla1=r(N mean sd)
	
	
frmttable using "Tabla1.tex", statmat(Tabla1) sdec(0,0,0) substat(1) ctitles("Variables", "Observations", "Mean", "Standard deviation") rtitles("Village population" \ "" \ "Rural per capita net income (yuan)" \ "Subsidy rate (per 1,000)" \ "" \ "Poor housing (per 100 HHs)" \ "" \ "Registered poor households (per 100 HHs)" \ "" \ "Disability rate (per 1,000)" \ "" \ "Number of village officials" \ "" \ "Village officials with “high school and above” education (percent)" \ "" \ "Village officials with middle school education (percent)" \ "" \ "Village officials with “primary school and below” education (percent)" \ "" \ "Agricultural households (per 100 households)" \ "" \ "Per capita business revenue (yuan)" \ "" \ "Village government fiscal revenue per capita (yuan)" \ "" \ "Village government fiscal expenditure per capita (yuan)" \ "" \ "Government collective revenue (yuan)" \ "" \ "Trained laborers (per 100)" \ "" \ "HHs with tap water access (per 100 HHs)"\ "" \ "HHs with computers (per 100 HHs)" \ "" \ "HHs with rural cooperative medical insurance (100 HHs)" \ "" \ ) title("Table 2 - Summary Statistics of NFS Villages" \ "" \ "School enrollment rate for children aged 7–13 (percent)") tex replace

*2. 

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














