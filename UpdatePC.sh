#!/bin/bash

#This will update catkin workspace and build it.

cp permo_car_pc.rosinstall ~/catkin_ws/
cd ~/catkin_ws
wstool init src permo_car_pc.rosinstall
wstool update -t src

# clean up nodes not needed in remote repo
rm -r src/PadPub/ps3joy
rm -r src/PadPub/spacenav_node
rm -r src/PadPub/wiimote

catkin build
rm permo_car_pc.rosinstall
