/*** DO NOT EDIT THIS LINE -----------------------------------------------------

Version: 0.0.0


Intro Description
=================

fwlgraph -- Generates graph of the residuals of y against residuals of x after
regressing on controls.  Illustrates the relationship between y and x after
partialling out the controls to visualize the marginal effect.


Author(s)
=================

Tim Foreman
Columbia University


Syntax
=================

{opt fwlgraph} {depvar} {indepvar} [{control vars}] 
[{cmd:,} {it:options}]

{synoptset 20 tabbed}{...}
{synopthdr}
{synoptline}
{synoptline}
----------------------------------------------------- DO NOT EDIT THIS LINE ***/



program fwlgraph
version 12
syntax varlist(fv) , [graphname(string)]


token `varlist'
local yvar="`1'"
local xvar="`2'"



local k=1
while "``k''"!="" {
local ++k
}
local --k
local i=3
local controls=""
while `i'<=`k' {

if substr("``i''",1,2)=="i." {
local factors="`factors' "+substr("``i''",3,.)
local ifactors="`ifactors' "+"``i''"
local ++i
}
else {

local controls="`controls' "+"``i''"
local ++i
}
}

capture drop yres xres


quietly reg `yvar' `controls' `ifactors'

predict yres, resid


quietly reg `xvar' `controls' `ifactors'

predict xres, resid


reg yres xres

scatter yres xres, msize(tiny)

end




