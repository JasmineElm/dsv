import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

data = {
    'date': pd.to_datetime(['2022-01-01', '2022-01-02', '2022-01-03', '2022-01-04', '2022-01-05', '2022-01-06']),
    'temperature': [20, 22, 25, 24.8, 27, 30],
    'humidity': [50, 55, 60, 60, 65, 70],
    'wind_speed': [10, 12.5, 15, 15.75, 18, 20]
}
df = pd.DataFrame(data)
# Plot the data
plt.figure(figsize=(10, 6))
plt.plot(df['date'], df['temperature'], label='Temperature')
plt.plot(df['date'], df['humidity'], label='Humidity')
plt.plot(df['date'], df['wind_speed'], label='Wind Speed')
plt.xlabel('Date')
plt.ylabel('Value')
plt.title('Weather Data - Imputed')
plt.legend()
plt.savefig('Assets/weather_data_imputed.png')
