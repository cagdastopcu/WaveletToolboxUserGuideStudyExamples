%% examples using objects
% plot and wpviewcf

close all, clear all,
clc,

%% load the signal

load noisbump

x = noisbump;

t = wpdec(x, 3, 'db2');
fig = plot(t);

%% get new tree

newt = plot(t, 'read', fig);

%Thefirst argument of the plot function in the last command
%is dummy. Then the general syntax is:
%newt = plot(DUMMY,'read',fig);
%where DUMMY is any object parented by an NTREE object.
%DUMMY can be any object constructor name, which returns
%anobject parented by an NTREE object. For example:
%newt = plot(ntree,'read',fig);
%newt = plot(dtree,'read',fig);
%newt = plot(wptree,'read',fig);

%% modify the new tree

% From the command line you can modify the new tree,
% then plot it.

newt = wpjoin(newt,3);
fig2 = plot(newt);

% Change Node Label from Depth_position to Index and
% click the node (3). You get the following figure.
% Using plot(newt,fig), the plot is done in the figure fig,
% which already contains a tree object.
% You can see the colored wavelet packets coefficients using
% from the command line, the wpviewcf function (type help
% wpviewcf for more information).

wpviewcf(newt,1)

%%%%%%%%%% 1'in alabilecegi degerler
%         1: 'FRQ : Global + abs'
%         2: 'FRQ : By Level + abs'
%         3: 'FRQ : Global'
%         4: 'FRQ : By Level'
%         5: 'NAT : Global + abs'
%         6: 'NAT : By Level + abs'
%         7: 'NAT : Global'
%         8: 'NAT : By Level'

% You get the following plot, which contains the terminal nodes
% colored coefficients.


