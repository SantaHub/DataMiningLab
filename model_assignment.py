#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Oct 19 14:09:17 2017

@author: austin
"""
# cd /home/austin/ML/LAB_ADML_temp/data

import numpy as np
import pandas as pd

data = pd.read_csv('Karunya_data.csv')

#No duplicates. But Radiation is 0 for 5518 datasets

y=np.array(data.SolRad)

features=list(data)
features.remove('SolRad')
X=data.as_matrix(features).astype(np.float)

from sklearn import preprocessing
scaler=preprocessing.StandardScaler()
X=scaler.fit_transform(X)

from sklearn.ensemble import RandomForestRegressor

clf=RandomForestRegressor()
clf.fit(X[:30000],y[:30000])
y_pred=clf.predict(X[30000:])

from sklearn.metrics import r2_score
r2_score(y[30000:],y_pred)


from keras.models import Sequential
from keras.layers import Dense

def baseline_model():
    print("came")
	# create model
    model = Sequential()
    model.add(Dense(6, input_dim=10, kernel_initializer='normal', activation='relu'))
    model.add(Dense(1, kernel_initializer='normal'))
	# Compile model
    model.compile(loss='mean_squared_error', optimizer='adam')
    return model

from keras.wrappers.scikit_learn import KerasRegressor
estimator = KerasRegressor(build_fn=baseline_model, nb_epoch=100, batch_size=10, verbose=0)

from sklearn.model_selection import KFold
from sklearn.model_selection import cross_val_score

estimator.fit(X[:30000],y[:30000])
y_pred = estimator.predict(X[30000:])
r2_score(y[30000:],y_pred)



seed = 7
np.random.seed(seed)
kfold = KFold(n_splits=10, random_state=seed)
results = cross_val_score(estimator, X, y, cv=kfold)
print("Results: %.2f (%.2f) MSE" % (results.mean(), results.std()))


