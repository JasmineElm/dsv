import pandas as pd
# load the data
headers=['Index', 'Name','DoB','Phone']
data = pd.read_csv('bad_data.csv', header=None, names=headers)
# count the missing values
missing_values = data.isnull().sum()
print(missing_values)
# print the row/s with missing values
print(data[data.isnull().any(axis=1)])
