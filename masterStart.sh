#!/bin/bash

function trap_ctrlc()
{
	ssh ubuntu@10.9.0.3 "pkill -9 startWscream.sh"
	ssh ubuntu@10.9.0.3 "pkill -9 rosmaster"
	ssh ubuntu@10.9.0.3 "pkill -9 scream_sender"
	ssh ubuntu@10.9.0.3 "pkill -9 roslaunch"
	ssh ubuntu@10.9.0.3 "pkill -9 rtsp"
	exit 2
}
trap "trap_ctrlc" 2

source ~/catkin_ws/devel/setup.bash

( ssh -T ubuntu@10.9.0.3 '~/PermoCar/startWscream.sh && bash' ) &
P0=$!
echo "Please stop whith ctrl-c, else remote scripts won't stop!"
sleep 10

export ROS_MASTER_URI="http://10.9.0.3:11311" # Probably not needed
export ROS_IP="10.9.0.2"
cd ~/scream
( ./screamlaptop.sh &> screamlaplog.log ) &
P1=$!
cd ~/PermoCar
roslaunch launch_teleop pc_launch.launch

wait $P0 $P1
