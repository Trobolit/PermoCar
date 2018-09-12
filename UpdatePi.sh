#!/bin/bash

#This will update catkin workspace and build it.

cp permo_car_rpi.rosinstall ~/catkin_ws/
cd ~/catkin_ws

#If old rosinstall exists remove it since otherwise it wont build as expected.
if [ -e "src/.rosinstall" ]
then
    rm "src/.rosinstall"
fi

wstool init src permo_car_rpi.rosinstall
wstool update -t src

catkin build
catkin build #Twice makes sure catkin simple acctually makes it through build. Bug?
rm permo_car_rpi.rosinstall
