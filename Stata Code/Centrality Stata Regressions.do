cd "C:\Users\feldberg.dartmouth\Documents\MDSC-Culminating-Experience--Dartmouth-College-"

* Load the merged data from the CSV file
import delimited ".\Intermediate Data\Centrality_Measures.csv", clear


* Run the regression for bkvlps
regress bkvlps centrality*

* Output the regression results for bkvlps
outreg2 using ".\Outputs\Centrality_stata_regression_results.doc", replace ctitle(bkvlps) keep(centrality*)

* Run the regression for epspx
regress epspx centrality*

* Output the regression results for epspx
outreg2 using ".\Outputs\Centrality_stata_regression_results.doc", append ctitle(epspx) keep(centrality*)
*****************************************************************
* Run the regression for bkvlps with company fixed effects
reghdfe bkvlps centrality*, absorb(cik)

* Output the regression results for bkvlps
outreg2 using ".\Outputs\Centrality_stata_regression_results.doc", append ctitle(bkvlps) keep(centrality*) addtext("Company Fixed Effects", "x")

* Run the regression for epspx including company fixed effects
reghdfe epspx centrality*, absorb(cik)

* Output the regression results for epspx
outreg2 using ".\Outputs\Centrality_stata_regression_results.doc", append ctitle(epspx) keep(centrality*) addtext("Company Fixed Effects", "x")
*****************************************************************
* Run the regression for bkvlps with year fixed effects, sector fixed effects
reghdfe bkvlps centrality*, absorb(sector)

* Output the regression results for bkvlps
outreg2 using ".\Outputs\Centrality_stata_regression_results.doc", append ctitle(bkvlps) keep(centrality*) addtext("Sector Fixed Effects", "x", "Year Fixed Effects", "x")

* Run the regression for epspx including year fixed effects, sector fixed effects
reghdfe epspx centrality*, absorb(sector)

* Output the regression results for epspx
outreg2 using ".\Outputs\Centrality_stata_regression_results.doc", append ctitle(epspx) keep(centrality*) addtext("Sector Fixed Effects", "x", "Year Fixed Effects", "x")

