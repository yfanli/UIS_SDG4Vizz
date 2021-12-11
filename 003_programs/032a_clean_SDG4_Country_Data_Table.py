# -*- coding: utf-8 -*-
"""
Created on Thu Aug 26 22:30:26 2021

@author: yi_li
"""

import pandas as pd
import numpy as np
import os

url2 = "http://tcg.uis.unesco.org/wp-content/uploads/sites/4/2021/05/SDG4_Countries_Tables_2021.xlsx" #SDG 4 Country Data Table (excel)


path = r"C:\Users\yi_li\Documents\GitHub\UIS_SDG4Vizz"
cleandata  = path + r"\002_data\022_cleandata"




## 2. SDG 4 Country Data Table (excel)
# Example sheet look up 
template = pd.read_excel(url2,sheet_name="Benin", skiprows=9,engine='openpyxl') # example sheet
template.shape
template.head(10)


# Iterate over all sheets
allsheets = pd.read_excel(url2,None, skiprows=9,engine='openpyxl')
vdf = []

for sheet_name, sheet_df in allsheets.items():
    if sheet_name in ['TOC']:
        continue
    else:
        for index, row in sheet_df.iterrows():
            for year in range(2010,2021):
                print(year)
                vlist = []
                vlist.append(row["SDG Target"])
                vlist.append(row["SDG Table"])        
                vlist.append(row["Related SDG Indicator"])
                vlist.append(row["SDG Indicator"])
                vlist.append(year)
                vlist.append(row[str(year)])
                vlist.append(sheet_name)
                vdf.append(vlist)
            
vdf=pd.DataFrame(vdf)

vdf.columns=["SDG Target", "SDG Table", "Related SDG Indicator", "SDG Indicator", "Year", "Value", "Country"]

vdf.to_csv(cleandata + r'SDG4_Country_Data_Table.csv')