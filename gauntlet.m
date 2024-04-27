addpath("C:\Users\kmoon\Downloads\Neato\")
neatov2.connect('192.168.16.126');
neatov2.testConnection();

sensors = neatov2.receive();
r = sensors.ranges;
theta = sensors.thetasInRadians;
d = 0.09;

x = (r .* cos(theta) - d);
y = (r .* sin(theta));

scatter(x, y)

[x_grid, y_grid]=meshgrid(-2:.001:2, -2:.001:2);
f = 0; %Quiver plot equation
for i = 1:size(x)
    current_x = x(i);
    current_y = y(i);
    % Add all walls to the quiver plot equation so it represents the map.
    f = f - log(sqrt((x-current_x).^2 + (y-current_y).^2));
end

% Add the ball to the equation.
f = f + log(sqrt((x + 1.1).^2 + (y + 0).^2));