# PermoCar
Git repo for remake of the PermoCar. This is V3. Developing takes place during course D7039E and E7032E.

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
