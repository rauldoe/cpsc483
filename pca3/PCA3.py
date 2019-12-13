# -*- coding: utf-8 -*-
"""
Created on Thu Dec 12 18:25:34 2019

@author: shlakhanpal
"""

import numpy as np
import matplotlib.pyplot as plt
import scipy.io #Used to load *.mat files
import matplotlib.pyplot as plt

datafile = 'PCAData.mat'
points = scipy.io.loadmat( datafile )

X = points['X'] 
# print('Printing data in X...')
# print(X)
m, n = X.shape

#print(m, n)


meanX = np.mean(X,axis =0)
stdX = np.std(X,axis =0)

normalized = (X - meanX)/stdX

# print(meanX)
# print(stdX)

SumX = np.sum(X, axis =0)
# print(SumX/50)

#print(normalized)
covariance = np.dot(normalized.transpose(), normalized)/(m)
# print(covariance)
eigenvalues, eigenvectors = np.linalg.eig(covariance)

# print(eigenvectors)

X_pca = np.dot(normalized, eigenvectors)
#print(X_pca.shape)

plt.scatter(X_pca[:,0], X_pca[:,0])
plt.plot((0, eigenvectors[0][0]), (0, eigenvectors[1][0]))
plt.plot((0, eigenvectors[0][1]), (0, eigenvectors[1][1]))
#plt.scatter(-X_pca[:,0], X_pca[:,1])
plt.show()
