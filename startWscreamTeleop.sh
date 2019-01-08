#!/bin/bash
source ~/catkin_ws/devel/setup.bash
export ROS_MASTER_URI="http://10.9.0.3:11311" # Probably not needed
export ROS_IP="10.9.0.2"
cd ~/scream
( ./screamlaptop.sh &> screamlaplog.log ) &
P1=$!
cd ~/PermoCar
roslaunch launch_teleop pc_launch.launch

wait $P1 $P2
