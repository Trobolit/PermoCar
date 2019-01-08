#!/bin/bash
source ~/catkin_ws/devel/setup.bash
#export ROS_MASTER_URI="http://10.9.0.3:11311" # Probably not needed
export ROS_IP="10.9.0.3"
cd ~/scream
( sh ~/scream/screamrpi.sh &> screamrpilog.log ) &
P1=$!
cd ~/PermoCar
roslaunch launch_permocar pi_launch.launch
#( roslaunch launch_permocar pi_launch.launch |& tee pilaunchlog.log ) &
#P2=$!

wait $P1 $P2
