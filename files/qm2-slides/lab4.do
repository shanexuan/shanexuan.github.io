* estout 

sysuse auto
regress price weight mpg
eststo model1
qu reg price weight mpg foreign
eststo model2
* for advanced setting of -esttab- 
* http://repec.org/bocode/e/estout/hlp_esttab.html
esttab, mtitles("m1" "m2") rename(weight whatever)


* section 3
load("hpi.dta")
reg AverageWellbeing010 GDPcapita
twoway scatter AverageWellbeing010 GDPcapita
twoway (lfitci AverageWellbeing010 GDPcapita) (scatter AverageWellbeing010 GDPcapita, mlabel(CountryName) mlabsize(tiny))
gen lgdp = log(1+GDPcapita)
twoway scatter AverageWellbeing010 lgdp
reg AverageWellbeing010 lgdp
* look at R2 and RMSE in the regressions. 
* what do they mean? 

* preserve, collapse, restore 
preserve 
collapse AverageWellbeing010, by(Country)
restore 
* for details, see 
* https://www.stata.com/manuals13/dcollapse.pdf
