
cap prog drop fwlgraph
prog def fwlgraph, eclass
	syntax [anything], [clusters(varname) absorb(varlist) weight(varname) lowess]
	* Obtain regresison equation
	gettoken subcmd 0 : 0
	gettoken equation 0 : 0, parse(",")
	* Define temporary variables
	if "`weights'"=="" {
		tempvar weights
		qui: gen `weights'=1 
	}
	if "`cluster'"=="" {
		tempvar clusters
		qui: gen `clusters'=_n 
	}
	* Obtain controls 
	tokenize `equation'
	local yvar="`2'"
	local xvar="`3'"
	local controls= subinstr("`equation'","`1' `2' `3'","",1)
	
	* Temporary residuals
	qui: tempvar y_resid 
	qui: tempvar x_resid
	
	
	* Residualizing	
	qui {
		if ("`absorb'"=="") {
			# Residualize outcome
			quietly reghdfe `yvar' `controls' [aw=`weights'], noabsorb vce(cluster `clusters') resid
			predict `y_resid', resid

			# Residualize treatment 
			quietly reghdfe `xvar' `controls'  [aw=`weights'], noabsorb vce(cluster `clusters') resid
			predict `x_resid', resid
		}
		else {
			# Residualize outcome
			quietly reghdfe `yvar' `controls'  [aw=`weights'], absorb(`absorb') vce(cluster `clusters') resid
			predict `y_resid', resid

			# Residualize treatment 
			quietly reghdfe `xvar' `controls'  [aw=`weights'], absorb(`absorb') vce(cluster `clusters') resid
			predict `x_resid', resid
		} 
	}

	# Create residualized graph
	if ("`lowess'"=="") {
		twoway (lfitci  `y_resid' `x_resid', lc(gs0) lw(medthick) estopts(cluster(`clusters'))) ///
			(scatter `y_resid' `x_resid' [aw=`weights'], mc(blue%20) ) ///
			(lfit  `y_resid' `x_resid', acolor(gray%50)), ///
			graphregion(color(white)) ///
			ytitle("Residuals - dependent variable", size(medlarge)) ///
			xtitle("Residuals - independent variable", size(medlarge))  ///
			legend(off)
	}
	else {
		twoway (scatter `y_resid' `x_resid' [aw=`weights'], mc(blue%20) ) ///
			(lowess  `y_resid' `x_resid', lc(gs0) lw(medthick)), ///
			graphregion(color(white)) ///
			ytitle("Residuals - dependent variable", size(medlarge)) ///
			xtitle("Residuals - independent variable", size(medlarge))  ///
			legend(off)
	}

end




