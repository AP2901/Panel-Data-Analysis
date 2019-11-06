import excel "C:\Users\admin\Downloads\trix\asn2\Submission\Data_Extract_From_World_Development_Indicators (1).xlsx", sheet("Sheet2 (3)") firstrow clear
rename GDPpercapitagrowthannual Y
encode CountryName , gen(id)
xtset id Year
xtline Y, overlay
xtline Y
qui tab Year , gen(yd)
xtsum
reg Y Populationgrowthannual
outreg2 using Final.xls
xtreg Y Populationgrowthannual, fe
estimates store res1
outreg2 using Final.xls
xtreg Y Populationgrowthannual, re
estimates store res2
outreg2 using Final.xls
reg Y Populationgrowthannual yd1-yd8
outreg2 using Final.xls
xtreg Y Populationgrowthannual yd1-yd8, fe
estimates store res3
outreg2 using Final.xls
xtreg Y Populationgrowthannual yd1-yd8, re
estimates store res4
outreg2 using Final.xls
xttest0
hausman res1 res2
hausman res3 res4
reg Y Populationgrowthannual i.Year
testparm i.Year
xtreg Y Populationgrowthannual i.Year, fe
testparm i.Year
xtreg Y Populationgrowthannual i.Year, re
testparm i.Year

