import pandas as pd
import numpy as np

# Create the data
data = {
    'date': pd.to_datetime(['2022-01-01', '2022-01-02', '2022-01-03', '2022-01-05', '2022-01-06']),
    'temperature': [20, 22, 25, 27, 30],
    'humidity': [50, 55, 60, 65, 70],
    'wind_speed': [10, np.nan, 15, 18, 20]
}

# Add the data to a DataFrame
df = pd.DataFrame(data)

# Calculate the date range
date_range = pd.date_range(start=df['date'].min(), end=df['date'].max())

# Create a DataFrame with the full date range
full_dates = pd.DataFrame({'date': date_range})

# Merge the original DataFrame with the full date range DataFrame
df = pd.merge(full_dates, df, on='date', how='left')

print(df)
