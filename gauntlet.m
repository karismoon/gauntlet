addpath("C:\Users\kmoon\Downloads\Neato\")

% Getting the LIDAR map
neatov2.connect('192.168.16.126');
neatov2.testConnection();
sensors = neatov2.receive();

angle_rotated = 0;
position_moved = [1 1.5];
r = sensors.ranges;
theta = sensors.thetasInRadians;
d = 0.09;

x = (r .* cos(theta) - d);
y = (r.* sin(theta));
one = ones(size(x));

lidar_pos = [x; y; one];
mainframe_pos = translatePos(position_moved(1), position_moved(2)) * rotateAngle(angle_rotated) * lidar_pos;
scatter(x, y, 10,"yellow")

% load("lidar_data.mat")
% scatter(x, y)
% [x_grid, y_grid]=meshgrid(-2:.1:2, -2:.1:2);
% f = 0; % Quiver plot equation
% for i = 1:size(x,2)
%     current_x = x(i);
%     current_y = y(i);
%     % Add all walls to the quiver plot equation so it represents the map.
%     f = f - log(sqrt((x_grid-current_x).^2 + (y_grid-current_y).^2));
% end
% 
% % Add the ball to the equation.
% f = f + log(sqrt((x_grid + 1.1).^2 + (y_grid + 0).^2));
% 
% [fx_grid, fy_grid] = gradient(f);
% % Make all vectors the same length
% fx_grid = -.06 .* fx_grid ./ sqrt(fx_grid.^2 + fy_grid.^2);
% fy_grid = -.06 .* fy_grid ./ sqrt(fx_grid.^2 + fy_grid.^2);
% quiver(x_grid, y_grid, fx_grid, fy_grid);
% 
% surf(x_grid, y_grid, f)