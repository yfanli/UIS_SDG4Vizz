import delimited "C:\Users\yi_li\Documents\GitHub\UIS_SDG4Vizz\002_data\SDG_DATA_NATIONAL.csv", clear
replace indicator_id = upper( indicator_id)
replace indicator_id = subinstr( indicator_id, " ", "",.)
save "C:\Users\yi_li\Documents\GitHub\UIS_SDG4Vizz\002_data\022_cleandata\SDG_National.dta", replace

import delimited "C:\Users\yi_li\Documents\GitHub\UIS_SDG4Vizz\002_data\SDG_COUNTRY.csv", varnames(1) clear 
save "C:\Users\yi_li\Documents\GitHub\UIS_SDG4Vizz\002_data\022_cleandata\SDG_Country.dta", replace

import delimited "C:\Users\yi_li\Documents\GitHub\UIS_SDG4Vizz\002_data\SDG_REGION.csv", varnames(1) clear 
save "C:\Users\yi_li\Documents\GitHub\UIS_SDG4Vizz\002_data\022_cleandata\SDG_Region.dta", replace

import delimited "C:\Users\yi_li\Music\MetaData\SDG_LABEL_corrected.csv", varnames(1) clear 
replace indicator_id = upper( indicator_id)
replace indicator_id = subinstr( indicator_id, " ", "",.)
save "C:\Users\yi_li\Documents\GitHub\UIS_SDG4Vizz\002_data\022_cleandata\SDG_LABEL.dta", replace

import delimited "C:\Users\yi_li\Documents\GitHub\UIS_SDG4Vizz\002_data\SDG_METADATA.csv", varnames(1) clear
drop if strlen( year)!=4
duplicates drop indicator_id country_id year, force

replace indicator_id = upper( indicator_id)
replace indicator_id = subinstr( indicator_id, " ", "",.)
foreach v in indicator_id country_id year{
	generate str `v'_string = `v'
	replace `v' = ""
	compress `v'
	replace `v' = `v'_string
	drop `v'_string
	describe `v'
}
destring year, replace
export delimited using "C:\Users\yi_li\Documents\GitHub\UIS_SDG4Vizz\002_data\022_cleandata\SDG_METADATA_unique.csv", replace
save "C:\Users\yi_li\Documents\GitHub\UIS_SDG4Vizz\002_data\022_cleandata\SDG_METADATA_unique.dta", replace



use "C:\Users\yi_li\Documents\GitHub\UIS_SDG4Vizz\002_data\022_cleandata\SDG_National.dta", clear
merge m:1 country_id using "C:\Users\yi_li\Documents\GitHub\UIS_SDG4Vizz\002_data\022_cleandata\SDG_Country.dta"
drop if _merge ==2
drop _merge

merge m:1 indicator_id using "C:\Users\yi_li\Documents\GitHub\UIS_SDG4Vizz\002_data\022_cleandata\mapping_ind_original.dta"
keep if _merge ==3
drop _merge

merge m:1 indicator_id using "C:\Users\yi_li\Documents\GitHub\UIS_SDG4Vizz\002_data\022_cleandata\SDG_LABEL.dta"
tab  indicator_id if _merge==1

tab  indicator_id if _merge==2 & strpos(indicator_id, "GCS")
tab  indicator_id if _merge==2 & strpos(indicator_id, "BOS")

* GCS
replace indicator_label_en ="The extent to which (i) global citizenship education and (ii) education for sustainable development are mainstreamed in national education policies" if indicator_id =="GCS.NATLEDUPOL"

replace indicator_label_en ="The extent to which (i) global citizenship education and (ii) education for sustainable development are mainstreamed in curricula" if indicator_id =="GCS.CURRICULA"

replace indicator_label_en ="The extent to which (i) global citizenship education and (ii) education for sustainable development are mainstreamed in teacher education" if indicator_id =="GCS.TEACHEDU"

replace indicator_label_en ="The extent to which (i) global citizenship education and (ii) education for sustainable development are mainstreamed in student assessment" if indicator_id =="GCS.STUDENTASSESSMENT"

* BOS
replace indicator_label_en ="Extent to which national education policies and education sector plans recognize a breadth of skills that needs to be enhanced in national education systems - Teaching and Learning" if indicator_id =="BOS.TL"

replace indicator_label_en ="Extent to which national education policies and education sector plans recognize a breadth of skills that needs to be enhanced in national education systems - Assessment and Accountability" if indicator_id =="BOS.AA"

replace indicator_label_en ="Extent to which national education policies and education sector plans recognize a breadth of skills that needs to be enhanced in national education systems - Enabling Environment" if indicator_id =="BOS.EE"

*RESDISADVPOP
replace indicator_label_en ="Existence of funding mechanisms to reallocate education resources to disadvantaged populations" if indicator_id =="RESDISADVPOP"

drop if _merge ==2
drop _merge


merge m:1 country_id using "C:\Users\yi_li\Documents\GitHub\UIS_SDG4Vizz\002_data\022_cleandata\SDG_Region_unique.dta"
drop if _merge ==2
drop _merge

// merge m:m country_id using "C:\Users\yi_li\Documents\GitHub\UIS_SDG4Vizz\002_data\022_cleandata\SDG_Region.dta"
// drop if _merge==2
// drop _merge
// drop if strpos(region_id, "SDG")==0

merge 1:1 country_id indicator_id year using "C:\Users\yi_li\Documents\GitHub\UIS_SDG4Vizz\002_data\022_cleandata\SDG_METADATA_unique.dta"

gen target = substr( indicator_number, 1, 3)
order target indicator_number indicator_id country_id country_name_en year value


drop if target ==""
export delimited using "C:\Users\yi_li\Documents\GitHub\UIS_SDG4Vizz\002_data\022_cleandata\SDGdashboards_cleandata.csv", replace