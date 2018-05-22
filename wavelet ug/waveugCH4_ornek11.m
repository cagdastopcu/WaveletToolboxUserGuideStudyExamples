%% examples using objects
% drawtree and readtree

%% load the signal

load noisbump;

x = noisbump;

t = wpdec(x, 3, 'db2');

fig = drawtree(t);
% the last command creates a gui

%% get new tree

newt = readtree(fig);

% From the command line you can modify the new tree;
% then plot it in the same figure.
newt = wpjoin(newt,3);
drawtree(newt,fig);