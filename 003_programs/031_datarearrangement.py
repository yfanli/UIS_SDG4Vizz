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

sheets = pd.read_excel(url2,None)

template = pd.read_excel(url2)

template.shape

sheet_df_list = []
# for sheet_name, sheet_df in sheets.items():
#     if sheet_name in ['Template','debug']:
#         continue
#     else:
#         print(sheet_df.shape)
#         sheet_val = sheet_df.values

#         # foundation learning skills
#         values = []
#         values = values+list(sheet_val[4][2:8])
#         values = values+list(sheet_val[6][2:8])
#         values = values+list(sheet_val[14][2:22])
#         values = values+list(sheet_val[15][2:22])
#         values.append(sheet_val[20][2])
        
#         template_aux = template.copy(deep=True)
#         template_aux['CO_LONG_NAMW'] = sheet_name
#         template['IND_YEAR'] = 2019
#         template_aux['FIG'] = values
#         template_aux['FOOTNOTE'] = sheet_val[-1][1].split(': ')[1]
#         sheet_df_list.append(template_aux)
        
# df = pd.concat(sheet_df_list)

# df.to_csv('sdg441_uis.csv')

# sheet_val[-1][1].split(': ')[1]

# sheet_val[14][2:22].shape