function drender( data, color )

    x=data(:,1);
    y=data(:,2);
    z=data(:,3);

    scatter3(x,y,z,ones(size(x))*5, color, 'filled');
end