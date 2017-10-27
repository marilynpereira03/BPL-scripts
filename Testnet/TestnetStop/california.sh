#Each script starts with a shebang and the path to the shell that you want to use. shebang is '#!'
#!/bin/bash

##Different paths that we will be using in our script
temp=testnet_stop.sh
fname="blockpool_california.pem"
address1="ubuntu@"
chmod 400 $fname

#array that storest the Public DNS IPv4
declare -a publicIp=( "ec2-54-153-35-65.us-west-1.compute.amazonaws.com" "ec2-54-183-178-42.us-west-1.compute.amazonaws.com" "ec2-54-241-135-25.us-west-1.compute.amazonaws.com" "ec2-54-183-177-13.us-west-1.compute.amazonaws.com" "ec2-52-53-202-67.us-west-1.compute.amazonaws.com" "ec2-54-67-105-171.us-west-1.compute.amazonaws.com" "ec2-52-53-154-54.us-west-1.compute.amazonaws.com" "ec2-54-183-31-221.us-west-1.compute.amazonaws.com" "ec2-54-219-167-117.us-west-1.compute.amazonaws.com" "ec2-54-153-59-159.us-west-1.compute.amazonaws.com" "ec2-54-215-143-117.us-west-1.compute.amazonaws.com" "ec2-52-53-223-107.us-west-1.compute.amazonaws.com" "ec2-54-215-249-24.us-west-1.compute.amazonaws.com" "ec2-52-53-212-68.us-west-1.compute.amazonaws.com" "ec2-54-153-1-207.us-west-1.compute.amazonaws.com" "ec2-52-53-177-244.us-west-1.compute.amazonaws.com" "ec2-54-219-167-13.us-west-1.compute.amazonaws.com" "ec2-54-153-16-118.us-west-1.compute.amazonaws.com" "ec2-54-215-146-2.us-west-1.compute.amazonaws.com" "ec2-54-193-77-165.us-west-1.compute.amazonaws.com")

#array that stores the publicIpv4
declare -a publicIpv4=( "54.153.35.65" "54.183.178.42" "54.241.135.25" "54.183.177.13" "52.53.202.67" "54.67.105.171" "52.53.154.54" "54.183.31.221" "54.219.167.117" "54.153.59.159" "54.215.143.117" "52.53.223.107" "54.215.249.24" "52.53.212.68" "54.153.1.207" "52.53.177.244" "54.219.167.13" "54.153.16.118" "54.215.146.2" "54.193.77.165")
## now loop through the above array
for i in ${!publicIp[*]};
do
   #echo "${publicIp[$index]} is Public DNS of  ${publicIpv4[$index]}"
   # or do whatever with individual element of the array
address=$address1${publicIp[$i]}
echo $address
ssh -oStrictHostKeyChecking=no -i $fname $address "bash -s" -- < $temp
echo  "DONE DONE ********************************************************************************************************"
done
