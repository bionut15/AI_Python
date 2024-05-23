#!/usr/bin/env python3
import rospy
import math
import sys
from geometry_msgs.msg import Twist
from std_srvs.srv import Empty

def move(pub):
    # Starts a new node
    vel_msg = Twist()

    # Receiveing the user's input
    print("Let's move your robot")
    speed = float(input("Input your speed:"))
    distance = float(input("Type your distance:"))
    isForward = bool(int(input("Forward? (1 for True, 0 for False): ")))

    # Checking if the movement is forward or backwards
    if isForward:
        vel_msg.linear.x = abs(speed)
    else:
        vel_msg.linear.x = -abs(speed)
        # Since we are moving just in x-axis
    vel_msg.linear.y = 0
    vel_msg.linear.z = 0
    vel_msg.angular.x = 0
    vel_msg.angular.y = 0
    vel_msg.angular.z = 0

    # Set the loop rate
    rate = rospy.Rate(10)  # 10hz

    while not rospy.is_shutdown():
        # Publish the velocity
        pub.publish(vel_msg)
        rate.sleep()

        # Set the current time for distance calculation
        t0 = rospy.Time.now().to_sec()
        current_distance = 0

        # Loop to move the turtle in a specified distance
        while current_distance < distance:
            # Takes actual time to velocity calculus
            t1 = rospy.Time.now().to_sec()
            # Calculates distance
            current_distance = speed * (t1 - t0)
        # After the loop, stop the robot
        vel_msg.linear.x = 0
        # Force the robot to stop
        pub.publish(vel_msg)
        break

    rospy.sleep(1)

def draw_star(pub):
    rate = rospy.Rate(1)  # Adjust this to control the speed of the turtle

    # Move forward to start drawing
    move_cmd = Twist()
    rospy.sleep(1)  # Adjust this to control the duration of forward motion

    # Rotate to start drawing the first side of the star
    rotate_cmd = Twist()
    rotate_cmd.angular.z = math.pi / 10  # 36 degrees
    pub.publish(rotate_cmd)
    rospy.sleep(1)  # Adjust this to control the duration of rotation

    # Draw each side of the star
    for _ in range(5):
        move_cmd.linear.x = 2.0  # Length of each side
        pub.publish(move_cmd)
        rospy.sleep(2)  # Adjust this to control the duration of forward motion
        rotate_cmd.angular.z = 4 * math.pi / 5  # 144 degrees
        pub.publish(rotate_cmd)
        rospy.sleep(1)  # Adjust this to control the duration of rotation

    # Stop the turtle
    stop_cmd = Twist()
    pub.publish(stop_cmd)

    #rospy.spin()
    rospy.sleep(1)

def draw_hexagon(pub):
    rate = rospy.Rate(1)  # Adjust this to control the speed of the turtle

    move_cmd = Twist()
    rospy.sleep(1)  # Adjust this to control the duration of forward motion

    rotate_cmd = Twist()
    rotate_cmd.angular.z = 0 #math.pi *2 / 3  # 36 degrees
    pub.publish(rotate_cmd)
    rospy.sleep(1)  # Adjust this to control the duration of rotation

    for _ in range(6):
        move_cmd.linear.x = 2.0  # Length of each side
        pub.publish(move_cmd)
        rospy.sleep(2)  # Adjust this to control the duration of forward motion
        rotate_cmd.angular.z = (math.pi * 2 /3)/2 
        pub.publish(rotate_cmd)
        rospy.sleep(1)  # Adjust this to control the duration of rotation

    # Stop the turtle
    stop_cmd = Twist()
    pub.publish(stop_cmd)

    #rospy.spin()
    rospy.sleep(1)
def reset_turtle():
    rospy.wait_for_service('/reset')
    try:
        reset = rospy.ServiceProxy('/reset', Empty)
        reset()
        rospy.loginfo("Turtle reset successfully.")
    except rospy.ServiceException as e:
        rospy.logerr("Service call failed: %s" % e)

def main():
    rospy.init_node('draw_hexagon', anonymous=True)
    pub = rospy.Publisher('/turtle1/cmd_vel', Twist, queue_size=10)

    while not rospy.is_shutdown():
        userInput = input("Enter command:\n l - Move program \n s - draw Star \n h - draw hexagon \n r - reset \n q - quit \n") 
        match userInput:
            case "l":
                 move(pub)
            case "s":
                 draw_star(pub)
            case "h":
                 draw_hexagon(pub)
            case "r":
                 reset_turtle()
            case "q":
                 sys.exit()
if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:pass
        
