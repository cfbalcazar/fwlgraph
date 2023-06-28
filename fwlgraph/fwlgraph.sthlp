{smcl}
{* *! version 1.0 30JUN2023}{...}
{title:Title}

{p2colset 5 18 20 2}{...}
{p2col :{cmd:fwlgraph} {hline 2}}Residualized graph using Frisch-Waugh-Lovell (FWL) theorem {p_end}
{p2colreset}{...}

{marker syntax}{...}
{title:Syntax}

{p 8 15 2} {cmd:fwlgraph:}
{cmd: {ul:reg}ress} {depvar} {indepvars} {cmd:,} [{opth weights(varname)} {opth absorb(varlist)}  {opth cluster(varname)} {opt lowess}] {p_end}

{marker opt_summary}{...}
{synoptset 22 tabbed}{...}
{synopthdr}
{synoptline}
	
{syntab:Optional}
{synopt :{opt weights(varname)}} runs the regression using the specified analytic weights.{p_end}
{synopt :{opt absorb(varlist)}} categorical variables that identify the fixed effects to be absorbed. This option implements {browse "https://github.com/sergiocorreia/reghdfe": reghdfe}.{p_end} 
{synopt :{opt cluster(varname)}} clusters to compute cluster-robust confidence bands. It does not work with {cmd:lowess} option. {p_end}
{synopt :{opt lowess}} includes a lowess line using a standard bandwidth. {p_end}

{marker description}{...}
{title:Description}

{pstd}
{cmd:fwlgraph} uses the FWL theorem and graphs the residuals of the dependent variable against residuals of treatment variable after regressing both on controls. The graph illustrates the relationship between the outcome and the treatment after partialling out all the controls. The first variable in {cmd:{ul:reg}ress} is the independent variable that is residualized (i.e., the treatment). {p_end}

{hline}
{marker examples}{...}
{title:Example}

{pstd}Using the data from {browse "https://github.com/cfbalcazar/fwlgraph/tree/main/fwlgraph": github repository}: {p_end}

{phang2}{cmd: u "https://raw.githubusercontent.com/cfbalcazar/fwlgraph/main/fwlgraph/datasim.dta", clear}{p_end}
{pstd} {p_end}

{pstd} Simple example: {p_end}

{phang2}{cmd: fwlgraph: reg y D x}{p_end}

{pstd} Example using absorb: {p_end}

{phang2}{cmd: fwlgraph: reg y D x, absorb(id) }{p_end}

{pstd} Example using lowess: {p_end}

{phang2}{cmd: fwlgraph: reg y D x, absorb(id) lowess }{p_end}


{hline}

{marker contact}{...}
{title:Author}

{pstd}Felipe Balcazar{break}
New York University, Wilf Department of Politics.{break}
Email: {browse "mailto:cfbalcazar@nyu.edu ":cfbalcazar@nyu.edu } {break}
{p_end}


{marker updates}{...}
{title:Updates}

{phang2}For updating the package please use: {p_end}

{phang2}{cmd: net install fwlgraph, from (https://raw.githubusercontent.com/cfbalcazar/fwlgraph/main/fwlgraph/) replace force all}

{marker notes}{...}
{title:Notes}

{pstd} Code based on a previous ado-file by {browse "https://timforeman.net/2018/02/12/visualizing-relationship-after-controls/": Tim Foreman}{break}
{p_end}

