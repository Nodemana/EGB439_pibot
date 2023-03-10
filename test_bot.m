pb = PiBot('172.19.232.184','172.19.232.104','15')
loc = pb.getLocalizerPose();
theta = loc.pose.theta
Rx = loc.pose.x
Ry = loc.pose.y
desired_theta = atan2((0-Ry),(0-Rx))


while (theta < desired_theta + 2) && (theta > desired_theta - 2)
    pb.setVelocity(0,0)
    loc = pb.getLocalizerPose();
    theta = loc.pose.theta
    Rx = loc.pose.x
    Ry = loc.pose.y
    desired_theta = atan2((0-Ry),(0-Rx))
    pb.setVelocity(5,-5)
    pause(1)
end
pb.setVelocity(0,0)

