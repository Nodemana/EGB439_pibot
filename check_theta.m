function adjusted_theta = check_theta(theta)
    rtheta = theta * pi/180
    if (rtheta > pi)
        adjusted_theta = -180 - ((pi - rtheta) * 180/pi)
    elseif (rtheta < -pi)
        adjusted_theta = 180 - ((-pi - rtheta) * 180/pi)
    end
end