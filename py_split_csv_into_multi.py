df = pd.read_csv('data-all.csv')
num_rows = len(df)
chunk_size = num_rows // 4  # Dividing the data into 4 parts approximately

data_parts = [df[i:i+chunk_size] for i in range(0, num_rows, chunk_size)]

# Write each part into a separate Excel file
for i, part in enumerate(data_parts):
    excel_filename = f'data-part_{i+1}.csv'  # Output Excel file name
    part.to_csv(excel_filename, index=False)

print("Data split and saved into Excel files.")
