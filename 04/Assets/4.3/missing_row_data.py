import pandas as pd
import numpy as np
from sklearn.impute import KNNImputer

data = {
    'date': pd.to_datetime(['2022-01-01', '2022-01-02', '2022-01-03', '2022-01-04', '2022-01-05', '2022-01-06']),
    'temperature': [20, 22, 25, np.nan, 27, 30],
    'humidity': [50, 55, 60, np.nan, 65, 70],
    'wind_speed': [10, np.nan, 15, np.nan, 18, 20]
}
df = pd.DataFrame(data)
# KNN imputation
print("KNN imputation")
knn_imputer = KNNImputer(n_neighbors=2)
df_knn = knn_imputer.fit_transform(
    df[['temperature', 'humidity', 'wind_speed']])
df[['temperature', 'humidity', 'wind_speed']] = df_knn
print(df)
