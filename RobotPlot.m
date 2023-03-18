function RobotPlot(loc, x_dash, y_dash)
    % Potential Updates: return the x and y matrix so at the end of a
    % 'run', the robots entire path can be mapped

    % Obtain current position
    x_hash = loc.pose.x;
    y_hash = loc.pose.y;
    theta_hash = loc.pose.theta;
    % Homogenous Transformation Matrix
    R = [cosd(theta_hash) -sind(theta_hash); sind(theta_hash) cosd(theta_hash)];
    t = [x_hash, y_hash]';
    T = [R t; 0 0 1];
    
    % Initial configuration of robot
    x = [-0.076,    -0.076, 0,      0.076,  0,      -0.076];
    y = [-0.076,    0.076,  0.076,  0,      -0.076, -0.076];

    % Transforming configuration
    for i = 1:length(x)
            ap(1) = x(i);
            ap(2) = y(i);
            ap(end+1) = 1;
            bp = T * ap';
            ap(end) = [];
            bp(end) = [];
            x(i) = bp(1);
            y(i) = bp(2);
    end

    % Plotting
    figure(1)
    xlim([-0.5 2])
    ylim([-0.5 2])
    plot(x, y)
    plot(x_dash, y_dash,'*')
end