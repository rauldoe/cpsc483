
import numpy as numpy
import matplotlib.pyplot as plt
import scipy.io
from scipy.linalg import svd

datafile = 'PCAData.mat'

points = scipy.io.loadmat(datafile)

A = points['X']
print(points['X'])

U, s, VT = svd(A)

print(U)
print(s)
print(VT)

x = [1,4,5,6,6,2,3]
mean = sum(x)/len(x)
std_dev = (1/len(x) * sum([ (x_i - mean)**2 for x_i in x]))**0.5

z_scores = [(x_i - mean)/std_dev for x_i in x]

# Min-Max scaling

minmax = [(x_i - min(x)) / (max(x) - min(x)) for x_i in x]