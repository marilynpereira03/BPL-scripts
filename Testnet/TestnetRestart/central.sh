#Each script starts with a shebang and the path to the shell that you want to use. shebang is '#!'
#!/bin/bash

##Different paths that we will be using in our script
temp=testnet_restart.sh
fname="blockpool_central.pem"
address1="ubuntu@"
chmod 400 $fname

#array that storest the Public DNS IPv4
declare -a publicIp=( "ec2-35-182-28-68.ca-central-1.compute.amazonaws.com" "ec2-52-60-226-39.ca-central-1.compute.amazonaws.com" "ec2-52-60-223-205.ca-central-1.compute.amazonaws.com" "ec2-52-60-187-26.ca-central-1.compute.amazonaws.com" "ec2-35-182-20-108.ca-central-1.compute.amazonaws.com" "ec2-35-182-24-15.ca-central-1.compute.amazonaws.com" "ec2-35-182-17-32.ca-central-1.compute.amazonaws.com" "ec2-52-60-188-7.ca-central-1.compute.amazonaws.com" "ec2-52-60-185-192.ca-central-1.compute.amazonaws.com" "ec2-52-60-193-171.ca-central-1.compute.amazonaws.com" "ec2-52-60-162-121.ca-central-1.compute.amazonaws.com" "ec2-35-182-13-245.ca-central-1.compute.amazonaws.com" "ec2-35-182-15-188.ca-central-1.compute.amazonaws.com" "ec2-35-183-254-176.ca-central-1.compute.amazonaws.com" "ec2-52-60-238-50.ca-central-1.compute.amazonaws.com" "ec2-35-182-23-198.ca-central-1.compute.amazonaws.com" "ec2-52-60-225-73.ca-central-1.compute.amazonaws.com" "ec2-52-60-222-47.ca-central-1.compute.amazonaws.com" )

#array that stores the publicIpv4
declare -a publicIpv4=( "35.182.28.68" "52.60.226.39" "52.60.223.205" "52.60.187.26" "35.182.20.108" "35.182.24.15" "35.182.17.32" "52.60.188.7" "52.60.185.192" "52.60.193.171" "52.60.162.121" "35.182.13.245" "35.182.15.188" "35.183.254.176" "52.60.238.50" "35.182.23.198" "52.60.225.73" "52.60.222.47" )
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
