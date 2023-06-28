# fwlgraph

This repository contains the command ```fwlgraph``` for Stata, is a helper program which allows one to visualize the relationship between a dependent variable and one independent variable of interest.  The approach is motivated by the Frisch-Waugh-Lovell theorem (one of my favorite theorems!).  It is quite useful to visualize what the regression with control variables is actually representing, which can help one determine whether a linear or other specification might make sense, as well as visually identifying outliers.

To install the package and update it the following command can be used in Stata:

```
net install fwlgraph, from (https://raw.githubusercontent.com/cfbalcazar/fwlgraph/main/fwlgraph/) replace force all
```

Improvements to the code are welcomed.

Keywords: FWL stata ; Firsch-Waugh-Lovell stata

*Note*: This Stata program builds on a similar program created by [Tim Foreman](https://timforeman.net/2018/02/12/visualizing-relationship-after-controls/). 


