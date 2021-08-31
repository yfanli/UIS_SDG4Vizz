# -*- coding: utf-8 -*-
"""
Created on Thu Aug 26 22:30:26 2021

@author: yi_li
"""

import pandas as pd
import numpy as np
import os

url  = "http://tcg.uis.unesco.org/wp-content/uploads/sites/4/2021/05/SDG4_Benchmark_Tables_2021.xlsx"  # SDG 4 Benchmarks Indicators Data Book (excel)
url1 = "http://tcg.uis.unesco.org/wp-content/uploads/sites/4/2021/05/SDG4_Global_Tables_2021.xlsx"  # SDG 4 Global Data Book by target (excel)
url2 = "http://tcg.uis.unesco.org/wp-content/uploads/sites/4/2021/05/SDG4_Countries_Tables_2021.xlsx" #SDG 4 Country Data Table (excel)
url3 = "http://tcg.uis.unesco.org/wp-content/uploads/sites/4/2020/11/SDG4-Data-tree-specifications-Mapping.xlsx" # SDG 4 Data Tree Specifications - Mapping (excel)
url4 = "ftp://ftp.uis.unesco.org/BDDS/SDG.zip" # SDG 4 Dataset

path = r"C:\Users\yi_li\Documents\GitHub\UIS_SDG4Vizz"
cleandata  = path + r"\002_data\022_cleandata"


## 0. SDG4_Benchmark_Tables_2021
# Example sheet look up 
template = pd.read_excel(url,sheet_name="2", skiprows=9,engine='openpyxl') # example sheet
template.shape
template.head(10)


# Iterate over all sheets
allsheets = pd.read_excel(url,None, skiprows=9,engine='openpyxl')
vdf = []

for sheet_name, sheet_df in allsheets.items():
    if sheet_name in ['TOC']:
        continue
    else:
        for index, row in sheet_df.iterrows():
            for year in range(2010,2021):
                print(year)
                vlist = []
                vlist.append(row["Region"])
                vlist.append(row["Country"])        
                vlist.append(year)
                vlist.append(row[str(year)])  # value year
                vlist.append(sheet_name)
                vdf.append(vlist)
            
vdf=pd.DataFrame(vdf)

vdf.columns=["Region", "Country", "Year", "Value", "Sheet" ]

# Add variables: Target 
vdf["Target"] = "1.a"
for i in range(3, 15):
    vdf['Target'][vdf['Sheet']==str(i)]="4.1"

for i in range(15, 18):
    vdf['Target'][vdf['Sheet']==str(i)]="4.2"
    
for i in range(18, 22):
    vdf['Target'][vdf['Sheet']==str(i)] = "4.c"

# Add variables: SDG Indicator #
vdf["SDG Indicator"] = "1.a.2"
for i in range(3, 9):
    vdf['SDG Indicator'][vdf['Sheet']==str(i)]="4.1.1"

for i in range(9, 12):
    vdf['SDG Indicator'][vdf['Sheet']==str(i)]="4.1.2"
    
for i in range(12, 15):
    vdf['SDG Indicator'][vdf['Sheet']==str(i)] = "4.1.4"

for i in range(15, 18):
    vdf['SDG Indicator'][vdf['Sheet']==str(i)] = "4.2.2"

for i in range(18, 22):
    vdf['SDG Indicator'][vdf['Sheet']==str(i)] = "4.c.1"

# Add variables: SDG Indicator Name
sdglist = ["Expenditure on education as a percentage of total government expenditure (%) ", "Proportion of students at the end of lower secondary education achieving at least a minimum proficiency level in mathematics, both sexes (%) ", "Proportion of students at the end of lower secondary education achieving at least a minimum proficiency level in reading, both sexes (%) ", "Proportion of students in Grade 2 or 3 achieving at least a minimum proficiency level in reading, both sexes (%) ", "Proportion of students at the end of primary education achieving at least a minimum proficiency level in mathematics, both sexes (%) ", "Proportion of students at the end of primary education achieving at least a minimum proficiency level in reading, both sexes (%) ", "Proportion of students in Grade 2 or 3 achieving at least a minimum proficiency level in mathematics, both sexes (%) ", "Completion rate, primary education, both sexes (%) ", "Completion rate, lower secondary education, both sexes (%) ", "Completion rate, upper secondary education, both sexes (%) ", "Out-of-school rate for children of primary school age, both sexes (%) ", "Out-of-school rate for adolescents of lower secondary school age, both sexes (%) ", "Out-of-school rate for youth of upper secondary school age, both sexes (%) ", "Adjusted net enrolment rate, one year before the official primary entry age, both sexes (%) ", "Adjusted net enrolment rate, one year before the official primary entry age, female (%) ", "Adjusted net enrolment rate, one year before the official primary entry age, male (%) ", "Proportion of teachers with the minimum required qualifications in primary education, both sexes (%) ", "Proportion of teachers with the minimum required qualifications in pre-primary education, both sexes (%) ", "Proportion of teachers with the minimum required qualifications in lower secondary education, both sexes (%) ", "Proportion of teachers with the minimum required qualifications in upper secondary education, both sexes (%)"]

my_dict = {}
for i,value in enumerate(sdglist):
    my_dict[i+2] = value

vdf['SDG Indicator Name']=""
for i in range(2,22):
    vdf['SDG Indicator Name'][vdf['Sheet']==str(i)] = my_dict[i] 

# Add variables: Indicator Code
sdgcodelist = ["XGOVEXP.IMF", "MATH.LOWERSEC", "READ.LOWERSEC", "READ.G2T3", "MATH.PRIMARY", "READ.PRIMARY", "MATH.G2T3", "CR.1", "CR.2", "CR.3", "ROFST.1.CP", "ROFST.2.CP", "ROFST.3.CP", "NERA.AGM1.CP", "NERA.AGM1.F.CP", "NERA.AGM1.M.CP", "TRTP.1", "TRTP.02", "TRTP.2", "TRTP.3"]

sdgcodedict = {}
for i, value in enumerate(sdgcodelist):
    sdgcodedict[i+2] = value
    
vdf["Indicator Code"] = ""
for i in range(2, 22):
    vdf["Indicator Code"][vdf['Sheet']==str(i)] = sdgcodedict[i]


vdf.to_csv(cleandata+r'\SDG4_Benchmark_Tables_2021.csv')

