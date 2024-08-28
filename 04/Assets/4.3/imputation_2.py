import pandas as pd
import numpy as np
from sklearn.impute import KNNImputer
from sklearn.linear_model import LinearRegression

data = {
    'A': [1, 2, np.nan, 4, 5],
    'B': [10, 20, 30, np.nan, 50],
    'C': [100, np.nan, 300, 400, 500]
}
df = pd.DataFrame(data)
# KNN imputation
print("KNN imputation")
knn_imputer = KNNImputer(n_neighbors=2)
df_knn = knn_imputer.fit_transform(df)
print(df_knn)

# Linear regression imputation
print("linear regression imputation")
linreg_imputer = LinearRegression()
df_linreg = df.copy()
for column in df_linreg.columns:
    missing = df_linreg[column].isnull()
    X = df_linreg[~missing].index.values.reshape(-1, 1)
    y = df_linreg[~missing][column]
    linreg_imputer.fit(X, y)
    df_linreg.loc[missing, column] = linreg_imputer.predict(
        df_linreg[missing].index.values.reshape(-1, 1))
print(df_linreg)
