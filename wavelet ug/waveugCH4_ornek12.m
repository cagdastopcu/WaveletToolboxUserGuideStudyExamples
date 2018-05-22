%% examples using objects
% Change Terminal Node Coefficients (image)

load gatlin2
t=wpdec2(X,1,'haar');
plot(t);

% Change Node Label from Depth_position to Index and
% click the node (0). You get the following figure.

% Now modify the coefficients of the four terminal nodes.
newt = t;
NBcols = 40;

for node = 1:4
    
    cfs = read(t, 'data', node);
    
    tmp = cfs(1:end, 1:NBcols);
    
    cfs(1:end, 1:NBcols) = cfs(1:end, end-NBcols+1:end);
    
    cfs(1:end, end-NBcols+1:end) = tmp;
    
    newt = write(newt, 'data', node, cfs);
    
end

plot(newt);

%Change Node Label from Depth_position to Index and
%click on the node (0). You get the following figure.