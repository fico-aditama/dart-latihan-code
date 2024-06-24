import os
import pandas as pd

def read_pagar_sheet(file_path):
    df_dict = pd.read_excel(file_path, sheet_name=None)
    pagar_sheet = df_dict.get('Pagar')
    return pagar_sheet

# Folder path where the Excel files are located
folder_path = './folder_now'

# Get a list of all files in the folder
files = [f for f in os.listdir(folder_path) if os.path.isfile(os.path.join(folder_path, f))]

# Create an empty DataFrame to store the combined 'Pagar' sheets
combined_df = pd.DataFrame()

# Loop through each file and read the 'Pagar' sheet
for idx, file in enumerate(files):
    if file.endswith('.xlsx'):
        file_path = os.path.join(folder_path, file)
        pagar_sheet = read_pagar_sheet(file_path)

        if pagar_sheet is not None:
            # Add a prefix to the sheet name to identify the source file
            sheet_name = f"excel{idx + 1}-pagar"
            pagar_sheet.name = sheet_name
            combined_df = pd.concat([combined_df, pagar_sheet], ignore_index=True)

# Save the combined 'Pagar' sheets to a new Excel file
output_file_name = 'combined_pagar.xlsx'
combined_df.to_excel(output_file_name, index=False)

print(f"Combined 'Pagar' sheets saved to {output_file_name}.")
