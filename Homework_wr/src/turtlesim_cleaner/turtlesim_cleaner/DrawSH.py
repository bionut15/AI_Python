import rclpy
import math
from rclpy.node import Node
from geometry_msgs.msg import Twist, Pose 
import sys 

class MinimalPublisher(Node):

    def __init__(self):
        super().__init__('draw_star_hexagon')
        timer_period = 0.5  # seconds
       # self.publisher_ = self.create_publisher(Twist, '/turtle1/cmd_vel', 10)
       # self.timer = self.create_timer(timer_period, self.DrawStar)

        self.publisher_= self.create_publisher(Pose, '/turtle1/pose', 10)
        self.timer = self.create_timer(timer_period, self.reset)

        self.i = 0

    def DrawStar(self):
        #Math variables
        R = 300.0 
        theta = (1 - math.sqrt(5))/2
        Points = 6
        O = 0.6
        a = 1 

        vel_msg = Twist();
        for a in range(Points):
          vel_msg.linear.z = float(0)
          vel_msg.angular.z = float(0)
          vel_msg.linear.x = R*math.cos(((4*math.pi)/5)*a+theta+O) 
          vel_msg.angular.x = float(0)
          vel_msg.linear.y = R*math.sin(((4*math.pi)/5)*a+theta+O) 
          vel_msg.angular.y = float(0)
          self.publisher_.publish(vel_msg)
          self.i += 1
          
    def reset(self):
        self.res_m = Pose()
        self.pose.x = 0.0
        self.res_m.y = 0.0
        self.self.publisher_.publish(res_m)
         
    #def DrawHexagon():
    #   pass     

def main(args=None):
    rclpy.init(args=args)

    minimal_publisher = MinimalPublisher()

    rclpy.spin(minimal_publisher)

    # Destroy the node explicitly
    # (optional - otherwise it will be done automatically
    # when the garbage collector destroys the node object)
    minimal_publisher.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
