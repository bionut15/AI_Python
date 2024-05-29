#!/bin/bash

# Set the ROS distribution
ROS_DISTRO=noetic

# Source the setup.sh file from the ROS installation
# This file sets up the environment for ROS
if [ -f /opt/ros/$ROS_DISTRO/etc/catkin/profile.d/10.ros.sh ]; then
  . /opt/ros/$ROS_DISTRO/etc/catkin/profile.d/10.ros.sh
fi

# Add ROS binary directories to the PATH
export PATH=$PATH:/opt/ros/$ROS_DISTRO/bin

# Set ROS environment variables
export ROS_ROOT=/opt/ros/$ROS_DISTRO/share/ros
export ROS_PACKAGE_PATH=/opt/ros/$ROS_DISTRO/share
export ROS_MASTER_URI=http://localhost:11311

# Add ROS libraries to the library path
export LD_LIBRARY_PATH=/opt/ros/$ROS_DISTRO/lib:$LD_LIBRARY_PATH

# Add ROS Python packages to the Python path
export PYTHONPATH=/opt/ros/$ROS_DISTRO/lib/python3/dist-packages:$PYTHONPATH

# Set ROSLISP_PACKAGE_DIRECTORIES
export ROSLISP_PACKAGE_DIRECTORIES=

# If the setup.bash of the workspace is available, source it
if [ -f $HOME/catkin_ws/devel/setup.bash ]; then
  . $HOME/catkin_ws/devel/setup.bash
fi

