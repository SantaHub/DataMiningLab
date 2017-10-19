#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Oct 11 21:55:15 2017

@author: austin
"""

import pandas as pd
import numpy as np
# cd /media/austin/56E4F88BE4F86E9D2/Learn/Karunya/7_sem/
df = pd.read_csv('input.csv')
df=df.dropna()
df['mean_temp']= (df['Min Temp'] +df ['Max Temp'])/2

import matplotlib.pyplot as plt
for f in list(df):
    plt.scatter(df['Radiation'],df[f])
    plt.xlabel(f)
    plt.show()

features = list(df)
features =['Latitude',
 'Longitude',
 'Altitude',
 'Min Temp',
 'Max Temp',
 'mean_temp',
 'Mean Sunshine Hours',
 'Radiation']
features.remove('Radiation')
X = df.as_matrix(features).astype(np.float)
y = df.as_matrix(['Radiation']).astype(np.float)

from sklearn import preprocessing
scaler = preprocessing.StandardScaler()
X = scaler.fit_transform(X) #features made unit varient

from sklearn.feature_selection import VarianceThreshold
sel = VarianceThreshold(threshold=(.7 * (1 - .7)))
sel.fit_transform(X)

'''
Accuracy: 0.47 (+/- 0.33)
from sklearn import ensemble
clf= ensemble.RandomForestRegressor()
'''
'''
Accuracy: 0.24 (+/- 0.33)
from sklearn import svm
clf=svm.SVR()
'''

from sklearn import ensemble
clf=ensemble.BaggingRegressor()

from sklearn.model_selection import cross_val_score
scores = cross_val_score(clf, X,y,cv=5)
print("Accuracy: %0.2f (+/- %0.2f)" % (scores.mean(), scores.std() * 2))


'''
Accuracy: 0.46 (+/- 0.22)

np.argwhere(np.isnan(X))
df1=preprocessing.normalize(df)


from wordsegment import segment		
wo = segment("how are you")
from nltk.corpus import words
english_vocab = set(w.lower() for w in words.words())

'''