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
cd "C:\Users\valul\OneDrive\Documents\UdeSA 2021\Semestre Primavera\Economía Aplicada\Tutorial 2\output" 					 



*1) Present a table with summary statistics of the following variables: village_pop, income_pc, subsidy_rate, poor_housing_rate, poor_reg_rate, disability_rate, gov_officials, high_gov_quality, mid_gov_quality, low_gov_quality, ag_rate, business_income_pc, fiscal_rev_pc, fiscal_exp_pc, col_revenue_pc, trained_labor_rate, safe_water_rate, computer_rate, med_ins_rate, and enroll_rate. 

*Replicate it twice: using esttab and frmttable. Add labels to the variables (do not change them by editing the Word/Tex file). Suggestion: when using esttab, use “wide” as an option.



estpost tabstat village_pop income_pc subsidy_rate poor_housing_rate poor_reg_rate disability_rate gov_officials high_gov_quality mid_gov_quality low_gov_quality ag_rate business_income_pc fiscal_rev_pc fiscal_exp_pc col_revenue_pc trained_labor_rate safe_water_rate computer_rate med_ins_rate enroll_rate, statistics(mean sd) columns(statistics)

*** Using esttab

***En los dos hay que ver el tema de las variables, porque puse label pero no se si tienen que aparecer asi. Ademas ver como poner 0 decimales, centrar titulo y poner titulo "Variable"

*Latex 

esttab using PS2_1.tex, replace frag cells("count mean(fmt(%13.2fc)) sd(fmt(%13.2fc))") nostar unstack noobs nonote label booktabs nopar wide title(Table 1 - Summary Statistics of Villages) eqlabels(, lhs("Variable")) addnotes(Note: The statistics are based on our analysis of ### villages)

*Word 

esttab using example.rtf, replace cells("count mean(fmt(%13.2fc)) sd(fmt(%13.2fc))") wide label nonumber nonote noobs title(Table 1 - Summary Statistics of Villages) collabels("Observations" "Mean" "Standard Deviation")  addnotes(Note: The statistics are based on our analysis of ### villages) eqlabels(, lhs("Variable")) 


***Using frmttable

tabstat village_pop income_pc subsidy_rate poor_housing_rate poor_reg_rate disability_rate gov_officials high_gov_quality mid_gov_quality low_gov_quality ag_rate business_income_pc fiscal_rev_pc fiscal_exp_pc col_revenue_pc trained_labor_rate safe_water_rate computer_rate med_ins_rate enroll_rate, save statistics(mean sd) columns(statistics)

* Save matrix
matrix A=r(StatTotal)

*La tabla del paper solo incluyo medias y desvios estandares, con lo cual a efectos de replicar esa tabla nos interesan las primeras dos columnas, que guardaremos en la nueva matriz `AA':

matselrc A AA, c(1 2)

frmttable using Table1, varlabels statmat(A) sdec(2,2) ctitles("Variables","Mean", "SD") replace 

frmttable using Table1.tex, frag varlabels tex statmat(AA) sdec(2,2) ctitles("Variable name","Mean", "SD") replace 












*2) For registered poor households, people with disabilities, subsidized population, and poor housing variables in levels run an OLS regression against “CGVO”. For each variable, run a simple regression and then a regression including precipitation and temperature as controls. Report the output using the command outreg2. Finally, repeat the analysis using a log-lin specification. Analyze qualitatively and quantitatively (sign and statistical significance) each coefficient.





