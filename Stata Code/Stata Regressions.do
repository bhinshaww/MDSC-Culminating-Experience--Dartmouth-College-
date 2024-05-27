cd "C:\Users\feldberg.dartmouth\Documents\MDSC-Culminating-Experience--Dartmouth-College-"

* Load the merged data from the CSV file
import delimited ".\Intermediate Data\no_dummies_financial_triad_merged.csv", clear


* Run the regression for bkvlps
regress bkvlps motif_*

* Output the regression results for bkvlps
outreg2 using ".\Outputs\stata_regression_results.doc", replace ctitle(bkvlps) keep(motif*)

* Run the regression for epspx
regress epspx motif_*

* Output the regression results for epspx
outreg2 using ".\Outputs\stata_regression_results.doc", append ctitle(epspx) keep(motif*)

* Run the regression for bkvlps with year fixed effects
areg bkvlps motif_*, absorb(year)

* Output the regression results for bkvlps
outreg2 using ".\Outputs\stata_regression_results.doc", append ctitle(bkvlps) keep(motif*) addtext("Year Fixed Effects", "x")

* Run the regression for epspx including year fixed effects, company effects
areg epspx motif_*, absorb(year)

* Output the regression results for epspx
outreg2 using ".\Outputs\stata_regression_results.doc", append ctitle(epspx) keep(motif*) addtext("Year Fixed Effects", "x")

* Run the regression for bkvlps with year fixed effects, company effects
areg bkvlps motif_*, absorb(year cik)

* Output the regression results for bkvlps
outreg2 using ".\Outputs\stata_regression_results.doc", append ctitle(bkvlps) keep(motif*) addtext("Year Fixed Effects", "x", "Company Fixed Effects", "x")

* Run the regression for epspx including year fixed effects
areg epspx motif_*, absorb(year cik)

* Output the regression results for epspx
outreg2 using ".\Outputs\stata_regression_results.doc", append ctitle(epspx) keep(motif*) addtext("Year Fixed Effects", "x", "Company Fixed Effects", "x")
