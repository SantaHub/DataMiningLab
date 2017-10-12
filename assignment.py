#!/usr/bin/env python3
# -*- coding: utf-8 -*-#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Oct 11 21:55:15 2017

@author: austin
"""

import pandas as pd
import numpy as np
# cd /media/austin/56E4F88BE4F86E9D2/Learn/Karunya/7_sem/"
df = pd.read_csv('input.csv')
df=df.dropna()

features = list(df)
features =['Latitude',
 'Longitude',
 'Altitude',
 'Min Temp',
 'Max Temp',
 'Mean Sunshine Hours',
 'Radiation']
features.remove('Radiation')
features.remove('Mean Sunshine Hours')
X = df.as_matrix(list(df)).astype(np.float)
y = df.as_matrix(['Latitude']).astype(np.float)

from sklearn import preprocessing

scaler = preprocessing.StandardScaler()
X = scaler.fit_transform(X) #features made unit varient


from sklearn import tree
from sklearn.model_selection import cross_val_score
clf= tree.DecisionTreeClassifier()
scores = cross_val_score(clf, X,y,cv=5)
print("Accuracy: %0.2f (+/- %0.2f)" % (scores.mean(), scores.std() * 2))

'''
np.argwhere(np.isnan(X))
df1=preprocessing.normalize(df)


from wordsegment import segment		
wo = segment("how are you")
from nltk.corpus import words
english_vocab = set(w.lower() for w in words.words())

'''
"""
Created on Wed Oct 11 21:55:15 2017

@author: austin
"""

import pandas as pd
import numpy as np
# cd /media/austin/56E4F88BE4F86E9D2/Learn/Karunya/7_sem/"
df = pd.read_csv('input.csv')
df=df.dropna()

features = list(df)
features =['Latitude',
 'Longitude',
 'Altitude',
 'Min Temp',
 'Max Temp',
 'Mean Sunshine Hours',
 'Radiation']
features.remove('Radiation')
features.remove('Mean Sunshine Hours')
X = df.as_matrix(list(df)).astype(np.float)
y = df.as_matrix(['Latitude']).astype(np.float)

from sklearn import preprocessing

scaler = preprocessing.StandardScaler()
X = scaler.fit_transform(X) #features made unit varient


from sklearn import tree
from sklearn.model_selection import cross_val_score
clf= tree.DecisionTreeClassifier()
scores = cross_val_score(clf, X,y,cv=5)
print("Accuracy: %0.2f (+/- %0.2f)" % (scores.mean(), scores.std() * 2))

'''
np.argwhere(np.isnan(X))
df1=preprocessing.normalize(df)


from wordsegment import segment		
wo = segment("how are you")
from nltk.corpus import words
english_vocab = set(w.lower() for w in words.words())

'''
