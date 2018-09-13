#!/bin/bash

#This will update catkin workspace and build it.


cp permo_car_pc.rosinstall ~/catkin_ws/
cd ~/catkin_ws

#If old rosinstall exists remove it since otherwise it wont build as expected.
if [ -e "src/.rosinstall" ]
then
    rm "src/.rosinstall"
fi

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
#catkin build #Twice makes sure catkin simple acctually makes it through build. Bug?
rm permo_car_pc.rosinstall
