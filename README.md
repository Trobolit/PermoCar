# PermoCar
Git repo for remake of the PermoCar. This is V3. Developing takes place during course D7039E and E7032E.

# Currently included git repos in install files

## on controller

To update code/nodes on pc just run the `UpdatePC.sh` in this repo. It will autmatically update your catkin_ws in your home folder.

* *[catkin_simple](https://github.com/catkin/catkin_simple.git):* Catkin simple to simplefy CMakeList.txt creation.
* *[joy](https://github.com/ros-drivers/joystick_drivers/tree/master/joy):* Code that polls gamepad (ROS node).
* *[launch_teleop](https://github.com/Trobolit/launch_teleop):* Launchfile to properly start teleop with joy_node.

To start teleopping: `roslaunch launch_teleop pc_launch.launch`

Note on `rosrun`. For tab completion to work you might need to `source ~/catkin_ws/devel/setup.bash`.

## on pi

To update code/nodes on pc just run the `UpdatePi.sh` in this repo. It will autmatically update your catkin_ws in your home folder.

* *[catkin_simple](https://github.com/catkin/catkin_simple.git):* Catkin simple to simplefie CMakeList.txt creation.
* *[motorcomm](https://github.com/Trobolit/motorcomm):* Code (ROS node) that communicates with the arduino that drives the motors.
* *[engine_mgmt](https://github.com/grammers/engine_mgmt):* Code (ROS node) that manages motor power (subscribes to controller input, encoder data, etc., and uses that in control loops)
* *[lauch_permocar](https://github.com/Trobolit/launch_permocar):* Launchfile to properly start the permocar.
* *[LMS1xx](https://github.com/grammers/LMS1xx):* lidar node

### Code not yet in node format

* *[permocar_scream](https://github.com/Trobolit/permocar_scream):* The code for the vision system is yet not integrated into ROS.
It does run paralell with ROS and works.



# Node statuses
| Node          | Who?          | Status                   | Comment   |
|:-------------:|:-------------:|:------------------------:|:---------:|
| Some node     | Someone       | not started/started/done | how/what? |
| Motorcomm  | Robert (Trobolit) |   started    | Finalize comments etc |

# Automatic Install instructions

## Set up workspace
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

## Download and build all relevant nodes

* clone this repo: `git clone https://github.com/Trobolit/PermoCar.git`
* `cd PermoCar`
* run the updatefile that you want, e.g. `./UpdatePC.sh`

If you update any source code just run `catkin build` and done!

# Manual Install instructions (discouraged)
 
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

