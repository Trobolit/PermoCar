# PermoCar
Git repo for remake of the PermoCar. This is V3. Developing takes place during course D7039E and E7032E.

# Install instruktions

Using wstool on permo_car_X.rosinstall whil clone all nedde noods!
permo_car_pc.rosinstall is for the nods needed on the user PC!
permo_car_rpi.rosInstall is for the nods needed on the rasbery pi!
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

### repositoris in permo_car.rosinstall

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

## Install file

Format in the .rosinstall file shud be
`- git: {local-name: NOOD_NAME, uri: 'URL', version: BRANCH}
