% HR = [cos(theta), -sin(theta), Rx;
%         sin(theta), cos(theta), Ry;
%         0,0,1]
% 
% HW = inv(HR)
% origin = [0;0;1]
% Rorigin = HW*origin
% Rorigin = [Rorigin(1),Rorigin(2)]
% Rorigin_theta = atan2d(Rorigin(1),Rorigin(2))




    
%     pb.setVelocity(0,0)
%     loc = pb.getLocalizerPose();
%     theta = loc.pose.theta;
%     Rx = loc.pose.x;
%     Ry = loc.pose.y;
% 
%     HR = [cos(theta), -sin(theta), Rx;
%             sin(theta), cos(theta), Ry;
%             0,0,1];
% 
%     HW = inv(HR);
%     origin = [0;0;1];
%     Rorigin = HW * origin;
%     Rorigin = [Rorigin(1),Rorigin(2)];
%     Rorigin_theta = atan2d(Rorigin(1),Rorigin(2));
%     pb.setVelocity(5,-5);
%     pause(2);