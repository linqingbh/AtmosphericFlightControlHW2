clc; clear all; close all; 

A = [1 2 -1; 
     0 1 0; 
     1 -4 2];
 
B = [1 0 0]';

% Controllablity matrix 
CG = [B A*B (A^2)*B]

rank(CG)

C = [1 0 0];

OG = [C; C*A; C*A^2]

rank(OG)


[V,D, W] = eig(A)

v11 =  [D(3,3)*eye(3,3) - A,B]
rank(v11) 
v22 = [D(2,2)*eye(3,3) - A,B]
rank(v22)
v33 = [D(1,1)*eye(3,3) - A,B]
rank(v33)
