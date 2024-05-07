#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from geometry_msgs.msg import Twist
import sys 

class MyNode(Node):
    def __init__(self):
        super().__init__("first_node")
        #self.get_logger().info("Hello")

    #def move():
        # Starts a new node
        node = rclpy.create_node('robot_cleaner')
        #rospy.init_node('robot_cleaner', anonymous=True)
        velocity_publisher = node.create_publisher(Twist , '/turtle1/cmd_vel', 10)
        #velocity_publisher = rospy.Publisher('/turtle1/cmd_vel', Twist, queue_size=10)
        vel_msg = Twist()
    
        # Receiveing the user's input
        print("Let's move your robot")
        try:
            speed = float(input("Input your speed:"))
            distance = float(input("Type your distance:"))
            isForward = bool(int(input("Forward? (1 for True, 0 for False): ")))
            if isForward:
                vel_msg.linear.x = abs(speed)
            else:
                vel_msg.linear.x = -abs(speed)
        except EOFError as e:
            print(end="")
    
        # Checking if the movement is forward or backwards
            
        # Since we are moving just in x-axis
        vel_msg.linear.y = float(0)
        vel_msg.linear.z =  float(0)
        vel_msg.angular.x = float(0)
        vel_msg.angular.y = float(0)
        vel_msg.angular.z = float(0)
    
        # Set the loop rate
        rate = node.create_rate(10)  # 10hz
    
        while not rclpy.ok():
            # Publish the velocity
            velocity_publisher.publish(vel_msg)
            rate.sleep()
    
            # Set the current time for distance calculation
            t0 = node.Time.now().to_sec()
            current_distance = 0
    
            # Loop to move the turtle in a specified distance
            while current_distance < distance:
                # Takes actual time to velocity calculus
                t1 = node.Time.now().to_sec()
                # Calculates distance
                current_distance = speed * (t1 - t0)
            # After the loop, stop the robot
            vel_msg.linear.x = 0
            # Force the robot to stop
            velocity_publisher.publish(vel_msg)
            break

def main(arg=None):
   rclpy.init(args=arg)
   Node = MyNode()
   rclpy.spin(Node)
   rclpy.shutdown()

if __name__ == "__main__":
   main() 
