#!/bin/bash

#This will update catkin workspace and build it.

cp permo_car_rpi.rosinstall ~/catkin_ws/
cd ~/catkin_ws
wstool init src permo_car_rpi.rosinstall
wstool update -t src

catkin build
rm permo_car_rpi.rosinstall
