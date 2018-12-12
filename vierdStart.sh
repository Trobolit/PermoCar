#!/bin/bash
source ~/catkin_ws/devel/setup.bash
#export ROS_MASTER_URI="http://192.168.1.227f:11311" # Probably not needed
export ROS_IP="10.180.65.19"
roslaunch launch_permocar pi_launch.launch

