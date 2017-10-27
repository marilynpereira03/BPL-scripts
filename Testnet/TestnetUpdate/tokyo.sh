#Each script starts with a shebang and the path to the shell that you want to use. shebang is '#!'
#!/bin/bash
attach=testnet_update.sh

fname="blockpool_tokyo.pem"
address1="ubuntu@"
chmod 400 $fname
declare -a publicIp=( "ec2-54-249-68-234.ap-northeast-1.compute.amazonaws.com" "ec2-13-115-246-232.ap-northeast-1.compute.amazonaws.com" "ec2-13-114-50-103.ap-northeast-1.compute.amazonaws.com" "ec2-54-199-164-104.ap-northeast-1.compute.amazonaws.com" "ec2-54-199-243-220.ap-northeast-1.compute.amazonaws.com" )
declare -a publicIpv4=( "54.249.68.234" "13.115.246.232" "13.114.50.103" "54.199.164.104" "54.199.243.220" )

## now loop through the above array
for i in ${!publicIp[*]};
do
   #echo "${publicIp[$index]} is Public DNS of  ${publicIpv4[$index]}"
   # or do whatever with individual element of the array
address=$address1${publicIp[$i]}
echo $address
ssh -oStrictHostKeyChecking=no -i $fname $address "bash -s" -- < $attach
done
