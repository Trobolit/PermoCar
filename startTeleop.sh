#!/bin/bash
source ~/catkin_ws/devel/setup.bash
export ROS_MASTER_URI="http://10.9.0.3:11311"
export ROS_IP="10.9.0.2"
roslaunch launch_teleop pc_launch.launch
