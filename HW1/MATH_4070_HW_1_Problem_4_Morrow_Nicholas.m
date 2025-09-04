% First clear memory to make sure any variables we use are created here
clear all

% Next, turn on echo so the commands are printed when the script runs
echo on

% Now start a diary to save everything to a text file
% and overwrite any existing diary files with this name
dfile ='MATH_4070_HW_1_Problem_4_Morrow_Nicholas.txt';
if exist(dfile, 'file')
    delete(dfile);
end
diary(dfile)

% MATH 4070
% HW 1
% Problem 4
% By Nicholas Morrow

% Part (a)

% IV (velocity) in multiples of 100 ft/sec as column vector
tData = [0; 2; 4; 6; 8; 10];

% DV (force) in multiples of 100 lb as column vector
fData = [0; 2.90; 14.8; 39.6; 74.3; 119];

% turns a scalar t into the row [1 t t^2 … t^5]
r = @(t) [1 t t^2 t^3 t^4 t^5];

% Build the 6×6 matrix
A = [ r(tData(1)) ; r(tData(2)) ; r(tData(3)) ;
    r(tData(4)) ; r(tData(5)) ; r(tData(6)) ]

% Solve for the coefficients  c = [c0 c1 … c5].'
c = A \ fData

% Part (b)

scaledSpeed = 7.5; % 7.5 * 100 = 750 ft/sec
scaledForce = r(scaledSpeed) * c % plug in speed in func we found in (a)
actualForce = 100 * scaledForce

% Turn the diary off
diary off
% Turn echo off
echo off