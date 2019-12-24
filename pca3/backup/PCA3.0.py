# -*- coding: utf-8 -*-
"""
Created on Thu Dec 12 18:25:34 2019

@author: shlakhanpal
"""

import numpy as np
import matplotlib.pyplot as plt
import scipy.io #Used to load *.mat files

datafile = 'dataPCA.mat'
points = scipy.io.loadmat( datafile )

X = points['X'] 
print('Printing data in X...')
print(X)
m, n = X.shape

print(m, n)


meanX = np.mean(X,axis =0)
stdX = np.std(X,axis =0)

print(meanX)
print(stdX)

SumX = np.sum(X, axis =0)
print(SumX/50)