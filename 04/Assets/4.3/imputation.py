import pandas as pd
import numpy as np

data = {
    'A': [1, 2, np.nan, 4, 5],
    'B': [10, 20, 30, np.nan, 50],
    'C': [100, np.nan, 300, 400, 500]
}

df = pd.DataFrame(data)

# Mean imputation for column A
df['A'] = df['A'].fillna(df['A'].mean())
# Median imputation for column B
df['B'] = df['B'].fillna(df['B'].median())
# mode imputation for column B
df['C'] = df['C'].fillna(df['C'].mode()[0])

print(df)
