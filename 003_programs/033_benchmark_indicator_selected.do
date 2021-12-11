clear
import delimited "C:\Users\yi_li\Music\SDG\SDG_DATA_NATIONAL.csv"

keep if indicator_id =="XGDP.FSGOV" | indicator_id =="XGOVEXP.IMF" | indicator_id =="MATH.LOWERSEC" | indicator_id =="READ.LOWERSEC" | indicator_id =="READ.G2T3" | indicator_id =="MATH.PRIMARY" | indicator_id =="READ.PRIMARY" | indicator_id =="MATH.G2T3" | indicator_id =="CR.1" | indicator_id =="CR.2" | indicator_id =="CR.3" | indicator_id =="ROFST.1.CP" | indicator_id =="ROFST.2.CP" | indicator_id =="ROFST.3.CP" | indicator_id =="NERA.AGM1.CP" | indicator_id =="TRTP.1" | indicator_id =="TRTP.02" | indicator_id =="TRTP.2" | indicator_id =="TRTP.3"
* | indicator_id =="ROFST.H.1" | indicator_id =="ROFST.H.2" | indicator_id =="ROFST.H.3" | indicator_id =="NARA.AGM1"


gen SDG_Indicator_Name =""
replace SDG_Indicator_Name ="1.a.gdp Government expenditure on education as a percentage of GDP" if indicator_id =="XGDP.FSGOV"
replace SDG_Indicator_Name ="1.a.2 Proportion of total government spending on essential services (education)" if indicator_id =="XGOVEXP.IMF"
replace SDG_Indicator_Name ="4.1.1.c Proportion of students at the end of lower secondary achieving at least a minimum proficiency level in mathematics" if indicator_id =="MATH.LOWERSEC"
replace SDG_Indicator_Name ="4.1.1.c Proportion of students at the end of lower secondary achieving at least a minimum proficiency level in reading" if indicator_id =="READ.LOWERSEC"
replace SDG_Indicator_Name ="4.1.1.a Proportion of students in Grade 2 or 3 achieving at least a minimum proficiency level in reading" if indicator_id =="READ.G2T3"
replace SDG_Indicator_Name ="4.1.1.b Proportion of students at the end of primary achieving at least a minimum proficiency level in mathematics" if indicator_id =="MATH.PRIMARY"
replace SDG_Indicator_Name ="4.1.1.b Proportion of students at the end of primary achieving at least a minimum proficiency level in reading" if indicator_id =="READ.PRIMARY"
replace SDG_Indicator_Name ="4.1.1.a Proportion of students in Grade 2 or 3 achieving at least a minimum proficiency level in mathematics" if indicator_id =="MATH.G2T3"
replace SDG_Indicator_Name ="4.1.2.i Completion rate in primary" if indicator_id =="CR.1"
replace SDG_Indicator_Name ="4.1.2.ii Completion rate in lower secondary" if indicator_id =="CR.2"
replace SDG_Indicator_Name ="4.1.2.iii Completion rate in upper secondary" if indicator_id =="CR.3"
replace SDG_Indicator_Name ="4.1.4.i Out-of-school rate in primary" if indicator_id =="ROFST.1.CP"
replace SDG_Indicator_Name ="4.1.4.ii Out-of-school rate in lower secondary" if indicator_id =="ROFST.2.CP"
replace SDG_Indicator_Name ="4.1.4.iii Out-of-school rate in upper secondary" if indicator_id =="ROFST.3.CP"
replace SDG_Indicator_Name ="4.2.2 Participation rate in organized learning (one year before the official primary entry age)" if indicator_id =="NERA.AGM1.CP"
replace SDG_Indicator_Name ="4.c.1.b Proportion of teachers with the minimum required qualifications in primary" if indicator_id =="TRTP.1"
replace SDG_Indicator_Name ="4.c.1.a Proportion of teachers with the minimum required qualifications in pre-primary" if indicator_id =="TRTP.02"
replace SDG_Indicator_Name ="4.c.1.c Proportion of teachers with the minimum required qualifications in lower secondary" if indicator_id =="TRTP.2"
replace SDG_Indicator_Name ="4.c.1.c Proportion of teachers with the minimum required qualifications in upper secondary" if indicator_id =="TRTP.3"
*replace SDG_Indicator_Name ="Out-of-school rate for children of primary school age, both sexes (household survey data) (%)" if indicator_id =="ROFST.H.1"
*replace SDG_Indicator_Name ="Out-of-school rate for adolescents of lower secondary school age, both sexes (household survey data) (%)" if indicator_id =="ROFST.H.2"
*replace SDG_Indicator_Name ="Out-of-school rate for youth of upper secondary school age, both sexes (household survey data) (%)" if indicator_id =="ROFST.H.3"
*replace SDG_Indicator_Name ="Adjusted net enrolment rate, one year before the official primary entry age, both sexes (household survey data) (%)" if indicator_id =="NARA.AGM1"



gen Indicator_Number = ""
replace Indicator_Number = "%GDP" if indicator_id =="XGDP.FSGOV"
replace Indicator_Number = "1.a.2" if indicator_id =="XGOVEXP.IMF"
replace Indicator_Number = "4.1.1.c" if indicator_id =="MATH.LOWERSEC"
replace Indicator_Number = "4.1.1.c" if indicator_id =="READ.LOWERSEC"
replace Indicator_Number = "4.1.1.a" if indicator_id =="READ.G2T3"
replace Indicator_Number = "4.1.1.b" if indicator_id =="MATH.PRIMARY"
replace Indicator_Number = "4.1.1.b" if indicator_id =="READ.PRIMARY"
replace Indicator_Number = "4.1.1.a" if indicator_id =="MATH.G2T3"
replace Indicator_Number = "4.1.2.i" if indicator_id =="CR.1"
replace Indicator_Number = "4.1.2.ii" if indicator_id =="CR.2"
replace Indicator_Number = "4.1.2.iii" if indicator_id =="CR.3"
replace Indicator_Number = "4.1.4.i" if indicator_id =="ROFST.1.CP"
replace Indicator_Number = "4.1.4.ii" if indicator_id =="ROFST.2.CP"
replace Indicator_Number = "4.1.4.ii" if indicator_id =="ROFST.3.CP"
replace Indicator_Number = "4.2.2" if indicator_id =="NERA.AGM1.CP"
replace Indicator_Number = "4.c.1.b" if indicator_id =="TRTP.1"
replace Indicator_Number = "4.c.1.a" if indicator_id =="TRTP.02"
replace Indicator_Number = "4.c.1.c" if indicator_id =="TRTP.2"
replace Indicator_Number = "4.c.1.d" if indicator_id =="TRTP.3"
*replace Indicator_Number = "4.1.4.i" if indicator_id =="ROFST.H.1"
*replace Indicator_Number = "4.1.4.ii" if indicator_id =="ROFST.H.2"
*replace Indicator_Number = "4.1.4.ii" if indicator_id =="ROFST.H.3"
*replace Indicator_Number = "4.2.2" if indicator_id =="NARA.AGM1"



gen Target = ""
replace Target ="1.a" if indicator_id =="XGDP.FSGOV"
replace Target ="1.a" if indicator_id =="XGOVEXP.IMF"
replace Target ="4.1" if indicator_id =="MATH.LOWERSEC"
replace Target ="4.1" if indicator_id =="READ.LOWERSEC"
replace Target ="4.1" if indicator_id =="READ.G2T3"
replace Target ="4.1" if indicator_id =="MATH.PRIMARY"
replace Target ="4.1" if indicator_id =="READ.PRIMARY"
replace Target ="4.1" if indicator_id =="MATH.G2T3"
replace Target ="4.1" if indicator_id =="CR.1"
replace Target ="4.1" if indicator_id =="CR.2"
replace Target ="4.1" if indicator_id =="CR.3"
replace Target ="4.1" if indicator_id =="ROFST.1.CP"
replace Target ="4.1" if indicator_id =="ROFST.2.CP"
replace Target ="4.1" if indicator_id =="ROFST.3.CP"
replace Target ="4.2" if indicator_id =="NERA.AGM1.CP"
replace Target ="4.c" if indicator_id =="TRTP.1"
replace Target ="4.c" if indicator_id =="TRTP.02"
replace Target ="4.c" if indicator_id =="TRTP.2"
replace Target ="4.c" if indicator_id =="TRTP.3"
*replace Target ="4.1" if indicator_id =="ROFST.H.1"
*replace Target ="4.1" if indicator_id =="ROFST.H.2"
*replace Target ="4.1" if indicator_id =="ROFST.H.3"
*replace Target ="4.2" if indicator_id =="NARA.AGM1"




merge m:1 country_id using "C:\Users\yi_li\Documents\GitHub\UIS_SDG4Vizz\002_data\SDG_COUNTRY.dta"
drop if _merge==2
drop _merge
rename country_name_en country

export delimited using "C:\Users\yi_li\Documents\GitHub\UIS_SDG4Vizz\002_data\022_cleandata\benchmark_cleandata.csv", replace