#!/bin/bash
source ~/catkin_ws/devel/setup.bash
#export ROS_MASTER_URI="http://10.9.0.3:11311" # Probably not needed
export ROS_IP="10.9.0.3"
roslaunch launch_permocar pi_launch.launch

