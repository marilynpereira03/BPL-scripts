#Each script starts with a shebang and the path to the shell that you want to use. shebang is '#!'
#!/bin/bash
attach=testnet_update.sh
configFileFirstPart="/config.BPL-testnet."
configFileLastPart=".json"
fname="blockpool_seoul_ubuntu.pem"
address1="ubuntu@"
chmod 400 $fname

#array that storest the Public DNS IPv4
declare -a publicIp=( "ec2-52-79-219-187.ap-northeast-2.compute.amazonaws.com" "ec2-13-124-137-65.ap-northeast-2.compute.amazonaws.com"  "ec2-52-78-18-248.ap-northeast-2.compute.amazonaws.com" "ec2-52-78-75-75.ap-northeast-2.compute.amazonaws.com" "ec2-52-79-131-49.ap-northeast-2.compute.amazonaws.com" "ec2-13-124-81-181.ap-northeast-2.compute.amazonaws.com" "ec2-52-78-142-250.ap-northeast-2.compute.amazonaws.com" "ec2-52-79-222-11.ap-northeast-2.compute.amazonaws.com" "ec2-13-124-57-236.ap-northeast-2.compute.amazonaws.com" "ec2-52-78-245-161.ap-northeast-2.compute.amazonaws.com" "ec2-13-124-38-51.ap-northeast-2.compute.amazonaws.com" "ec2-52-79-173-88.ap-northeast-2.compute.amazonaws.com" "ec2-52-78-0-102.ap-northeast-2.compute.amazonaws.com" "ec2-52-79-159-14.ap-northeast-2.compute.amazonaws.com" "ec2-13-124-154-184.ap-northeast-2.compute.amazonaws.com" "ec2-13-124-83-56.ap-northeast-2.compute.amazonaws.com" "ec2-13-124-157-246.ap-northeast-2.compute.amazonaws.com" "ec2-52-79-74-38.ap-northeast-2.compute.amazonaws.com" "ec2-13-124-18-254.ap-northeast-2.compute.amazonaws.com" "ec2-13-124-7-213.ap-northeast-2.compute.amazonaws.com" )

#array that stores the publicIpv4
declare -a publicIpv4=( "52.79.219.187" "13.124.137.65" "52.78.18.248" "52.78.75.75" "52.79.131.49" "13.124.81.181" "52.78.142.250" "52.79.222.11"  "13.124.57.236" "52.78.245.161" "13.124.38.51" "52.79.173.88" "52.78.0.102" "52.79.159.14" "13.124.154.184" "13.124.83.56"  "13.124.157.246" "52.79.74.38" "13.124.18.254" "13.124.7.213" )

## now loop through the above array
for i in ${!publicIp[*]};
do
   #echo "${publicIp[$index]} is Public DNS of  ${publicIpv4[$index]}"
   # or do whatever with individual element of the array
address=$address1${publicIp[$i]}
echo $address

ssh -oStrictHostKeyChecking=no -i $fname $address "bash -s" -- < $attach
done
