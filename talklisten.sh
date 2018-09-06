#!/bin/bash

# Start the listener here locally.
export ROS_IP=10.9.0.2
export ROS_MASTER_URI=http://10.9.0.3:11311
( rosrun rospy_tutorials listener.py > tmp.log ) &
P1=$!

# Set up environment on pi and start the talker

ssh ubuntu@10.9.0.3 << EOF
  source /opt/ros/kinetic/setup.bash
  export ROS_IP=10.9.0.3
  rosrun rospy_tutorials talker.py 
EOF

wait $P1
