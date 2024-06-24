from pandas.io.stata import StataReader
file_name = r'C:\temp\USER_RLMS-HSE_IND_1994_2017_v2_eng.dta'
sr = StataReader(file_name, convert_missing=False, chunksize=1000, convert_categoricals=False)
labels = sr.value_labels()  # To use later
for block in sr:
    temp = block
    break


import pandas as pd
df = pd.read_stata('ipumsi_00014_ethn.dta',convert_categoricals=False)
sr = pd.io.stata.StataReader('ipumsi_00014_ethn.dta')
vl = sr.value_labels()
sr.close()
