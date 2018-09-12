# PermoCar
Git repo for remake of the PermoCar. This is V3. Developing takes place during course D7039E and E7032E.

# Currently included git repos in install files

## on controller

To update code/nodes on pc just run the `UpdatePC.sh` in this repo. It will autmatically update your catkin_ws in your home folder.

* Catkin simple to simplefie CMakeList.txt creation: https://github.com/catkin/catkin_simple.git
* Code that polls gamepad: https://github.com/ros-drivers/joystick_drivers/tree/master/joy

Launch file not made. To run: `rosrun joy joy_node _deadzone:=0.1`

Note on `rosrun`. For tab completion to work you might need to `source ~/catkin_ws/devel/setup.bash`.

## on pi

To update code/nodes on pc just run the `UpdatePi.sh` in this repo. It will autmatically update your catkin_ws in your home folder.

* Catkin simple to simplefie CMakeList.txt creation: https://github.com/catkin/catkin_simple.git
* Code that talks to arduino motor drive: https://github.com/grammers/EngineMgmt

# Node statuses
| Node          | Who?          | Status      |
| :------------:|:-------------:|:-----------:|
| motorcomm_node  | Robert (Trobolit)       | subscribe to Twist ok, now onto serial! |
| Some node     | Someone       | not started |


# Install instructions
 
 `wstool` with permo_car_X.rosinstall will clone all needed nodes for you.
 
* `permo_car_pc.rosinstall` is for the nodes needed on the user PC.
* `permo_car_rpi.rosInstall` is for the nodes needed on the rasbery pi.

### First step

Create a catkin workspace where all the packages will be, together with the source folder.

Example:

```
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws
catkin init
catkin config --extend /opt/ros/kinetic
```

Or one-liner:

```
cd ~/catkin_ws
catkin config --mkdirs --extend /opt/ros/kinetic --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_BUILD_TYPE=Release
```

### Populate src folder using wstool

Go to the catkin workspace:

`cd ~/catkin_ws`

Populate the src folder:

`wstool init src permo_car_X.rosinstall`

### Updating (pulling latest changes)

To update or pull the latest changes run:

`wstool update -t src`

### Finalizing

Now you can build the workspace as normally using `catkin build`.

Note: If the command `catkin build` cannot be found you might be missing `python-catkin-tools`. Use `sudo apt-get install python-catkin-tools`.

## Install file

Format in the .rosinstall file shud be
`- git: {local-name: NOOD_NAME, uri: 'URL', version: BRANCH}`

# Notes

## Bash scripts for startups

Remember to have set up ssh-keys for passwordless entry, otherwise these scripts might fail.
See this link for instructions:
http://owncld.duckdns.org/myDoc/Ericsson/screamSetup.html#setting-up-ssh-keys

## Running ROS over VPN
Since ROS default is resolving ips through dhcp/dns server and the current VPN server does not have it, one needs to:
on pi:
```Bash
export ROS_IP=10.9.0.3
```
And on Laptop run
```Bash
export ROS_IP=10.9.0.2
```
before starting nodes that need to communicate over the VPN link.

## Printing to file for serial comm with Arduino
If you cant set serial link setup properly in the program you may need to run this command on the Pi before running the relayer.
```
stty -F /dev/ttyACM0 sane raw pass8 -echo -hupcl clocal 57600
```

## Uploading .ino files to Arduino from RPI via terminal

There are two arduinos connected, one that is essentially an Uno that drives the motors and one that is arm-based and manages the encoders.

To upload code to the motor-driver the following suffices:
```
 .[path to arduino binary]/arduino --upload [path to .ino sketch]/OldArduinoDriver.ino  --port /dev/ttyACM0
```

To upload to the other additional flags might be needed.

## Notes from Korken
* use catkin_simple
* use catkin build, not catkin make.
* Dont use rosserial on arduino, make your own bridge instead.
* Use Ros install files.
* https://github.com/LTU-CEG
* On RPI build for release since we are limited on speed.
* Use one git repo per ROS-node.

