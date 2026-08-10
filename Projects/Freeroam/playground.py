import numpy as np
import math as mt

A = [[1,2,3,4,5],[5,6,7,8,9],[10,11,12,13,14],[15,16,17,18,19],[20,21,22,23,24]]
print(A)
B = []
for i in range(2,4):
    C = []
    for j in range(1,4):
        # print(A[i][j])
        C.append(A[i][j])
    B.append(C)
        
# Target: 
# [11 12 13]
# [16 17 18]
print(B)