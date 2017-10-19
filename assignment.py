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
messy_features=["RainDay","SolRadAcc","WDAvgDay","","WSMinDay","WSMaxDay","ATMinDay","ATMaxDay","RHMinDay","RHMaxDay" ]

data=[]
for x in range(0,len(junk),8):
    # Date and month
    if (int(junk['Time'][x].split(':')[0]) == 0 )and (int(junk['Time'][x].split(':')[1]) == 0):
        continue;
    instance = junk['Date'][x].split('/')[1]+','+junk['Date'][x].split('/')[0]
    # Time
    if int(junk['Time'][x].split(':')[1])>0:
        instance+=','+str(int(junk['Time'][x].split(':')[0])+0.5)
    else : 
        instance+=','+str(int(junk['Time'][x].split(':')[0]))
        
    for y in range(x,x+8):
        instance+=','+str(junk['Value'][y])
    
    data.append(instance)
    
    
    
with open('Karunya_data.csv','w') as file:
    for x in data:
        file.writelines(x+'\n')