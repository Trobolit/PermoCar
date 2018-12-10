# PermoCar
Git repo for remake of the PermoCar. This is V3. Developing takes place during course D7039E and E7032E.


# Node/code statuses

* PC nodes
* Rpi nodes
* Arduino code
* Other code/programs

## PC nodes

| Node          | Who?          | Status                   | Comment   |
|:-------------:|:-------------:|:------------------------:|:---------:|
| [control_panel](https://github.com/Oscarsandstrom/control_panel) | Oscar (Oscarsandstrom) | Finished | Up and running |
| [PadPub (joy)](https://github.com/grammers/joystick_drivers) | Samuel (grammers) | done | up and running |
| [permocar_scream (receiver on pc)](https://github.com/Trobolit/permocar_scream) | | not started | not needed? |
| [referens_node](https://github.com/grammers/referens_node) | Samuel | up and running | | 
| [RVis (lidar plot)](https://wiki.ros.org/rviz) | Samuel | Working and launchin with seetings | |


## Rpi nodes

| Node          | Who?          | Status                   | Comment   |
|:-------------:|:-------------:|:------------------------:|:---------:|
| [coll_detect](https://github.com/Oscarsandstrom/coll_detect) | Oscar (Oscarsandstrom) | working | testing ongoing |
| [encodercomm](https://github.com/Trobolit/encodercomm.git) | Robert (Trobolit) |   working   | needs testing and review |
| [engine_mgmt](https://github.com/grammers/engine_mgmt) | Samuel (collaborative) | running but not finished | waiting for additional inputs |
| [kalmanfilter (for v, w and troques)](https://github.com/grammers/kalmanfilter) | Olov Samuel | not tuned | |
| gyro_node | | no hardware, no code, just an idea | skiped for time constraint|
| [LMS1xx (lidar node)](https://github.com/grammers/LMS1xx) | Robert | Running, needs cleanup | |
| [motorcomm](https://github.com/Trobolit/motorcomm) | Robert (Trobolit) |   waiting for review    | Finalize comments etc |
| [nmea_navsat_driver](https://github.com/Trobolit/nmea_navsat_driver) | N/A | Finished | |
| [relaycomm](https://github.com/Trobolit/relaycomm) | Robert, Samuel | Working, not finished | |
| [permocar_scream (sender on Rpi)](https://github.com/Trobolit/permocar_scream) | | not started | needed? |
| [settings](https://github.com/grammers/settings) | Samuel (grammers) | initial testing | No contol panel to test against |
| [step_responses](https://github.com/Trobolit/step_responses) | Robert (Trobolit) | not finished | might never need to finish |
| [vw_generator](https://github.com/Trobolit/vw_generator) | Robert (Trobolit) | Working, needs review | |



## Arduino Code

| Node          | Who?          | Status                   | Comment   |
|:-------------:|:-------------:|:------------------------:|:---------:|
| [encoder_listener](https://github.com/Trobolit/encoder_listener)  | Robert (Trobolit) |   waiting for review    | Working |
| [motor_driver](https://github.com/Trobolit/motor_driver)  | Robert (Trobolit)  |   working, serious bug found   | fix for bug already implemented in relay_setter  |
| [relay_setter](https://github.com/Trobolit/relay_setter) | Robert (Trobolit) | waiting for review | |

### Hardware ports for arduinos

* /dev/ttyACM0 - relaycomm
* /dev/ttyACM1 - motordriver
* /dev/ttyACM2 - encodercomm
* /dev/ttyUSB0 - nmea_navsat_driver (gps)


## Other code/programs

| Node          | Who?          | Status                   | Comment   |
|:-------------:|:-------------:|:------------------------:|:---------:|
| [catkin_simple](https://github.com/catkin/catkin_simple.git) |  | Ready to use | Build tool |
| [lauch_permocar](https://github.com/Trobolit/launch_permocar) | Oscar/Rasmus? | working, does not include all nodes yet| |
| [launch_teleop](https://github.com/Trobolit/launch_teleop) | Oscar/Rasmus? | working, does not include all nodes yet| |
| [rviz](https://wiki.ros.org/rviz) | | ready to use | might need config for gps |


# Currently included git repos in launch files

Remember that there are scripts in this repo that automatically sets environment correctly and then calls the launch files.

## on PC/controller

To update code/nodes on pc just run the `UpdatePC.sh` in this repo. It will autmatically update your catkin_ws in your home folder.

* *[joy](https://github.com/ros-drivers/joystick_drivers/tree/master/joy):* Code that polls gamepad (ROS node).
* *[control_panel](https://github.com/Oscarsandstrom/control_panel):* Code that creates a window with information of the data or topics during runtime. The control panel requires pygame to function, use sudo apt-get install python-pygame to install pygame.

## on pi

To update code/nodes on pc just run the `UpdatePi.sh` in this repo. It will autmatically update your catkin_ws in your home folder.

* *[motorcomm](https://github.com/Trobolit/motorcomm):* Code (ROS node) that communicates with the arduino that drives the motors.
* *[engine_mgmt](https://github.com/grammers/engine_mgmt):* Code (ROS node) that manages motor power (subscribes to controller input, encoder data, etc., and uses that in control loops)
* *[LMS1xx](https://github.com/grammers/LMS1xx):* lidar node
* *[coll_detect](https://github.com/Oscarsandstrom/coll_detect):* Code (ROS node) that subscribes to the lidar node and checks the ranges array to detect incoming collisions and then publishes a boolean telling other subcribers if it's about to collide.
* *[encodercomm](https://github.com/Trobolit/encodercomm.git):* Code that talks serially with the encoder arduino, extracts the data an publishes velocities of the wheels.

### Nodes to be added in launch file 

## Code not yet in node format

* *[permocar_scream](https://github.com/Trobolit/permocar_scream):* The code for the vision system is yet not integrated into ROS.
It does run paralell with ROS and works.


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

## SICK LMS111 help scripts
Since the LIDAR may end up in wierd edge cases and the ROS node used *might* (not verified) put it in a bad state, that cannot be adjusted, some python scripts have been made to simplify the factory reset, network setup, and testing of it.
The scripts are pretty self explainatory and can be found here:
[LMS111_helpScripts](https://github.com/Trobolit/LMS111_helpScripts)

## Dialout group (serial permissions)

For ros nodes to be able to communicate over serial ports without modifying file permissions on boot the ros user needs to be in the dialout group. To add a user:

```
sudo adduser [username] dialout
```

For one time tests you can also run:
```
sudo chmod 666 /dev/tty[portname]
```

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

