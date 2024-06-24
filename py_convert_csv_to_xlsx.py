# Manual Attach CSV Name
python -c "import pandas as pd; pd.read_csv('input.csv').to_excel('output.xlsx', index=False)"

# Automatic Attach CSV Name in folder
python -c "import pandas as pd, os, glob; [pd.read_csv(dfc).to_excel(os.path.splitext(os.path.basename(dfc))[0] + '.xlsx', index=False) for dfc in glob.glob('./*.csv')]"

python -c "import pandas as pd, os, glob; [pd.read_csv(file).to_excel(file[:-4] + '.xlsx', index=False) for file in glob.glob('./*.csv')]"

python -c "import pandas, os, glob; [pandas.read_csv(file).to_excel(file[:-4] + '.xlsx', index=False) for file in glob.glob('./*.csv')]"
