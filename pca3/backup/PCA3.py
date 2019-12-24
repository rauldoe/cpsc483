# -*- coding: utf-8 -*-
"""
Created on Thu Dec 12 18:25:34 2019

@author: shlakhanpal
"""

import numpy as np
import matplotlib.pyplot as plt
import scipy.io #Used to load *.mat files
import matplotlib.pyplot as plt

def normalize(X,meanX,stdX):
    
    
    X = (X-meanXReplicate)/stdXReplicate
        
    return X

# loading file
datafile = 'PCAData.mat'
points = scipy.io.loadmat( datafile )

# print shape of original data
X = points['X'] 
print('Printing data in X...')
print(X)
m, n = X.shape

print(m, n)
original = X.copy()

SumX = np.sum(X, axis =0)
meanX = np.mean(X,axis =0)
stdX = np.std(X,axis =0)

print(meanX)
print(stdX)
# print(SumX/50)

meanXReplicate = np.tile(meanX,(m,1))
stdXReplicate = np.tile(stdX,(m,1))
#print(meanXReplicate)

X = normalize(X,meanXReplicate,stdXReplicate)

# print(X)
# meanX = np.round(np.mean(X,axis =0),2)
# stdX = np.std(X,axis =0)
# print(meanX)
# print(stdX)




# my original attempt
normalized = (X - meanX)/stdX
#print(normalized)

covariance = np.dot(normalized.transpose(), normalized)/(m)
# print(covariance)
eigenvalues, eigenvectors = np.linalg.eig(covariance)

# print(eigenvectors)

X_pca = np.dot(normalized, eigenvectors)
#print(X_pca.shape)

plt.scatter(X_pca[:,0], X_pca[:,0])
plt.plot((0, eigenvectors[0][0]), (0, eigenvectors[1][0]), c='red')
plt.plot((0, eigenvectors[0][1]), (0, eigenvectors[1][1]), c='green')
#plt.scatter(-X_pca[:,0], X_pca[:,1])
plt.show()
