#!/usr/bin/env python

import rospy
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist

class WallFollower:
    def __init__(self):
        rospy.init_node('wall_follower', anonymous=True)
        
        self.scan_subscriber = rospy.Subscriber('/scan', LaserScan, self.scan_callback)
        self.cmd_vel_publisher = rospy.Publisher('/cmd_vel', Twist, queue_size=10)
        
        self.twist = Twist()
        self.rate = rospy.Rate(10)
    
    def scan_callback(self, data):
        # Define thresholds
        wall_distance = 1.0  # Desired distance from the wall
        max_distance = 2.0   # Maximum distance to consider an object
        
        # Extract distances at specific angles
        front_distance = data.ranges[len(data.ranges)//2]
        right_distance = data.ranges[len(data.ranges)//2 + len(data.ranges)//4]
        
        # Determine control actions
        if front_distance < wall_distance:
            # Turn left if too close to the wall
            self.twist.linear.x = 0.1
            self.twist.angular.z = 0.5
        elif right_distance > wall_distance:
            # Turn right if too far from the wall
            self.twist.linear.x = 0.2
            self.twist.angular.z = -0.3
        else:
            # Go straight
            self.twist.linear.x = 0.2
            self.twist.angular.z = 0.0

        # Publish the twist message
        self.cmd_vel_publisher.publish(self.twist)

    def run(self):
        while not rospy.is_shutdown():
            self.rate.sleep()

if __name__ == '__main__':
    try:
        follower = WallFollower()
        follower.run()
    except rospy.ROSInterruptException:
        pass
