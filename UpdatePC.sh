#!/bin/bash

#This will update catkin workspace and build it.

cp permo_car_pc.rosinstall ~/catkin_ws/
cd ~/catkin_ws
wstool init src permo_car_pc.rosinstall
wstool update -t src

# clean up nodes not needed in remote repo
if [ -d "src/PadPub/wiimote" ]; then
rm -r src/PadPub/ps3joy
fi
if [ -d "src/PadPub/wiimote" ]; then
rm -r src/PadPub/spacenav_node
fi
if [ -d "src/PadPub/wiimote" ]; then
rm -r src/PadPub/wiimote
fi

catkin build
rm permo_car_pc.rosinstall
