#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Oct 18 01:48:04 2017

@author: austin
"""
# cd /home/austin/ML/LAB_ADML_temp/data

import pandas as pd
import numpy as np

junk = pd.read_csv('Karunya_ssp_20160105.csv')

#If messy _feature SKIP. 
messy_features=["RainDay","SolRadAcc","WDAvgDay","WSMinDay","WSMaxDay","ATMinDay","ATMaxDay","RHMinDay","RHMaxDay" ]

#Getting messy Index
for x in messy_features:
    messy_index+=list(np.where(junk['Features']==x)[0])

data=junk[junk.Features != "RainDay"]
for x in messy_features:
    data=data[data.Features != x]

junk=data.reindex()
write=[]
for x in range(0,len(junk),8):
    # Date and month
    instance = junk.iloc[x]['Date'].split('/')[1]+','+junk.iloc[x]['Date'].split('/')[0]
    # Time
    if int(junk.iloc[x]['Time'].split(':')[1])>0:
        instance+=','+str(int(junk.iloc[x]['Time'].split(':')[0])+0.5)
    else : 
        instance+=','+str(int(junk.iloc[x]['Time'].split(':')[0]))
        
    for y in range(x,x+8):
        instance+=','+str(junk.iloc[y]['Value'])
    
    write.append(instance)
    
    
data.to_csv('Karunya_data.csv',index=False)

with open('Karunya_data.csv','w') as file:
    for x in write:
        file.writelines(x)
        file.writelines('\n')
        
