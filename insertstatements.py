import csv
import pandas as pd

# Read the CSV file using pandas
df = pd.read_csv('music.csv')

# Define the column names according to your table structure
column_names = ['track_id', 'track_name', 'artist_id', 'artist_name', 'album_id', 
                'duration', 'release_date', 'popularity', 'danceability', 
                'energy', 'liveness', 'playlist_id', 'playlist_name']

# Open a file to write the SQL statements
with open('insert_statements.sql', 'w') as f:
    for _, row in df.iterrows():
        values = []
        for column_name in column_names:
            # Get the value from the dataframe row
            value = row[column_name]
            # If the value is a string, add quotations around it
            if isinstance(value, str):
                value = f"'{value}'"
            values.append(str(value))
        # Prepare the SQL INSERT statement
        sql = f"INSERT INTO ArtistData({', '.join(column_names)}) VALUES ({', '.join(values)});\n"
        # Write the SQL statement to the file
        f.write(sql)
