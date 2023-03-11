pb = PiBot('172.19.232.184','172.19.232.104','15')
loc = pb.getLocalizerPose();
theta = loc.pose.theta
Rx = loc.pose.x
Ry = loc.pose.y
desired_theta = atan2d((0-Ry),(0-Rx))


% while theta ~= desired_theta
while (theta > check_theta(desired_theta + 5)) || (theta < check_theta(desired_theta - 5))
    disp("Loop")
    loc = pb.getLocalizerPose();
    theta = loc.pose.theta
    Rx = loc.pose.x
    Ry = loc.pose.y
    desired_theta = atan2d((0-Ry),(0-Rx))
    pb.setVelocity(5,-5)
    pause(1)
    pb.setVelocity(0,0)
end
pb.setVelocity(0,0)

