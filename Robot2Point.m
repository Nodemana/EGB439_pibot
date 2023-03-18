pb = PiBot('172.19.232.184','egb439localiser2','15');

% Desired Location, Dash: *
x_dash = 0;
y_dash = 0;

% Proportional Controller
Kv = 50; % Proportional Gain - Velocity
Kh = 0.25; % Proportional Gain - Heading Angle

% Maximum and minimum values of velocity
v_max = 50;
v_min = 5;

while true
    % Obtain current location, Hash: #
    loc = pb.getLocalizerPose();
    x_hash = loc.pose.x;
    y_hash = loc.pose.y;
    theta_hash = loc.pose.theta;       
    
    % Calculate delta of x & y
    delta_x = x_dash - x_hash;
    delta_y = y_dash - y_hash;

    % Calculate distance from # to *
    dist = sqrt(delta_x^2 + delta_y^2);

    % Set a velocity, c in proportion to distance
    v = min(max(Kv*dist,v_min), v_max);
    pb.setVelocity(v, v);
    
    % Calculate theta*, the desired angle the robot should be looking
    theta_dash = atan2d(delta_y, delta_x);
    % Retrieve delta theta for steering angle 
    delta_theta = check_theta(theta_dash - theta_hash);
    if delta_theta > 0
        yaw = max(Kh*delta_theta,v_min);
    end
    if delta_theta < 0
        yaw = min(Kh*delta_theta,-v_min);
    end
    pb.setVelocity(-yaw, yaw);

    % if the robot has reached its destination, break the loop
    if dist < 0.05
        pb.setVelocity(0, 0);
        break
    end
end

function adjusted_theta = check_theta(theta)
    rtheta = theta * pi/180;
    if (rtheta > pi)
        adjusted_theta = -180 - ((pi - rtheta) * 180/pi);
    elseif (rtheta < -pi)
        adjusted_theta = 180 - ((-pi - rtheta) * 180/pi);
    else
        adjusted_theta = theta;
    end
end