myrobot = PiBotSim('coppeliasim', true);

x_dash = -1.95;
y_dash = -1.825;
Kv = 100; % Proportional Gain - Velocity
Kh = 1.4; % Proportional Gain - Heading Angle
v_max = 50;
v_min = 15;

while true
   
    pose = myrobot.getLocalizerPose;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %your code to control the robot here
    x_hash = pose(1);
    y_hash = pose(2);
    theta_hash = mod(rad2deg(pose(3)),360);
    delta_x = x_dash - x_hash;
    delta_y = y_dash - y_hash;
    theta_dash = atan2d(delta_y, delta_x);
    d2r = pi/180;
    delta_theta = angdiff(theta_dash*d2r, theta_hash*d2r)/d2r;

    dist = sqrt(delta_x^2 + delta_y^2);
    v = min(max(Kv*dist,v_min), v_max);
    myrobot.setWheelVel([v v]);
    
    myrobot.step();

    if delta_theta > 0
        yaw = max(Kh*delta_theta,v_min);
    end
    if delta_theta < 0
        yaw = min(Kh*delta_theta,-v_min);
    end
    
    myrobot.setWheelVel([yaw, -yaw]);

    if dist < 0.05
        myrobot.setWheelVel([0 0]);
        break
    end

% steering to a point
%     if delta_theta > 0
%         yaw = max(Kh*delta_theta,v_min);
%     end
%     if delta_theta < 0
%         yaw = min(Kh*delta_theta,-v_min);
%     end
%     myrobot.setWheelVel([yaw, -yaw]);
%     if abs(delta_theta) < 0.1
%         myrobot.setWheelVel([0 0]);
%         break
%     end
    

% driving to a point in a straight line
%     v = min(max(Kv*delta_x,v_min), v_max);
%     myrobot.setWheelVel([v v]);
%     if delta_x < 0.05
%         myrobot.setWheelVel([0 0]);
%         break
%     end
    
    

    
    
    
%     if myrobot.getSimulationTime > 5
%         break
%     end
    

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    myrobot.step();

end

clear myrobot
