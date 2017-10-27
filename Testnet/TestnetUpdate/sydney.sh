#Each script starts with a shebang and the path to the shell that you want to use. shebang is '#!'
#!/bin/bash
attach=testnet_update.sh
fname="blockpool_sydney_ubuntu.pem"
address1="ubuntu@"
chmod 400 $fname

#array that storest the Public DNS IPv4
declare -a publicIp=( "ec2-54-252-170-222.ap-southeast-2.compute.amazonaws.com" "ec2-54-206-6-159.ap-southeast-2.compute.amazonaws.com" "ec2-54-252-231-219.ap-southeast-2.compute.amazonaws.com" "ec2-54-206-34-155.ap-southeast-2.compute.amazonaws.com" "ec2-54-252-196-54.ap-southeast-2.compute.amazonaws.com" "ec2-54-206-102-110.ap-southeast-2.compute.amazonaws.com" "ec2-54-206-127-71.ap-southeast-2.compute.amazonaws.com" "ec2-54-206-62-7.ap-southeast-2.compute.amazonaws.com" "ec2-54-252-240-43.ap-southeast-2.compute.amazonaws.com" "ec2-54-206-11-174.ap-southeast-2.compute.amazonaws.com" "ec2-54-206-37-83.ap-southeast-2.compute.amazonaws.com" "ec2-54-252-195-137.ap-southeast-2.compute.amazonaws.com" "ec2-54-206-124-126.ap-southeast-2.compute.amazonaws.com" "ec2-54-206-112-250.ap-southeast-2.compute.amazonaws.com" "ec2-54-206-126-1.ap-southeast-2.compute.amazonaws.com" "ec2-54-206-116-105.ap-southeast-2.compute.amazonaws.com" "ec2-54-252-219-179.ap-southeast-2.compute.amazonaws.com" "ec2-54-252-241-45.ap-southeast-2.compute.amazonaws.com" "ec2-54-252-243-3.ap-southeast-2.compute.amazonaws.com" )

#array that stores the publicIpv4
declare -a publicIpv4=( "54.252.170.222" "54.206.6.159" "54.252.231.219" "54.206.34.155" "54.252.196.54" "54.206.102.110" "54.206.127.71" "54.206.62.7" "54.252.240.43" "54.206.11.174" "54.206.37.83" "54.252.195.137" "54.206.124.126" "54.206.112.250" "54.206.126.1" "54.206.116.105" "54.252.219.179" "54.252.241.45" "54.252.243.3" "54.206.64.22" )

## now loop through the above array
for i in ${!publicIp[*]};
do
   #echo "${publicIp[$index]} is Public DNS of  ${publicIpv4[$index]}"
   # or do whatever with individual element of the array
address=$address1${publicIp[$i]}
echo $address

ssh -oStrictHostKeyChecking=no -i $fname $address "bash -s" -- < $attach
done
