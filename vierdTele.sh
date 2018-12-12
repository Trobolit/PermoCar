#!/bin/bash
source ~/catkin_ws/devel/setup.bash
export ROS_MASTER_URI="http://10.180.65.19:11311"
export ROS_IP="10.180.65.22"
roslaunch launch_teleop pc_launch.launch
