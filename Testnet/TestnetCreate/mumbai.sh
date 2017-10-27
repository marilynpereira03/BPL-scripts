#Each script starts with a shebang and the path to the shell that you want to use. shebang is '#!'
#!/bin/bash

##Different paths that we will be using in our script
peerScriptPath=../developerInstallation.sh

#NEEDCHANGES HERE
#configFilePath=/home/avinash/Desktop/private/config_files
configFilePath=/home/avinash/Desktop/private/config_files
attach=testnet_start.sh

configFileFirstPart="/config.BPL-testnet."
configFileLastPart=".json"
fname="blockpool_mumbai.pem"
address1="ubuntu@"
chmod 400 $fname

#array that storest the Public DNS IPv4
#declare -a publicIp=( "ec2-13-126-40-180.ap-south-1.compute.amazonaws.com" "ec2-13-126-15-102.ap-south-1.compute.amazonaws.com" "ec2-52-66-188-114.ap-south-1.compute.amazonaws.com" "ec2-35-154-61-167.ap-south-1.compute.amazonaws.com" "ec2-52-66-140-164.ap-south-1.compute.amazonaws.com" "ec2-52-66-64-51.ap-south-1.compute.amazonaws.com" "ec2-13-126-16-197.ap-south-1.compute.amazonaws.com" "ec2-35-154-59-104.ap-south-1.compute.amazonaws.com" "ec2-52-66-87-25.ap-south-1.compute.amazonaws.com" "ec2-35-154-232-3.ap-south-1.compute.amazonaws.com" "ec2-35-154-163-68.ap-south-1.compute.amazonaws.com" "ec2-35-154-81-120.ap-south-1.compute.amazonaws.com" "ec2-13-126-36-16.ap-south-1.compute.amazonaws.com" "ec2-52-66-176-112.ap-south-1.compute.amazonaws.com" "ec2-52-66-184-223.ap-south-1.compute.amazonaws.com" )

declare -a publicIp=( "ec2-35-154-249-42.ap-south-1.compute.amazonaws.com" "ec2-52-66-86-126.ap-south-1.compute.amazonaws.com" "ec2-13-126-40-249.ap-south-1.compute.amazonaws.com" "ec2-52-66-147-61.ap-south-1.compute.amazonaws.com" "ec2-35-154-21-98.ap-south-1.compute.amazonaws.com" "ec2-13-126-40-180.ap-south-1.compute.amazonaws.com" "ec2-13-126-15-102.ap-south-1.compute.amazonaws.com" "ec2-52-66-188-114.ap-south-1.compute.amazonaws.com" "ec2-35-154-61-167.ap-south-1.compute.amazonaws.com" "ec2-52-66-140-164.ap-south-1.compute.amazonaws.com" "ec2-52-66-64-51.ap-south-1.compute.amazonaws.com" "ec2-13-126-16-197.ap-south-1.compute.amazonaws.com" "ec2-35-154-59-104.ap-south-1.compute.amazonaws.com" "ec2-52-66-87-25.ap-south-1.compute.amazonaws.com" "ec2-35-154-232-3.ap-south-1.compute.amazonaws.com" "ec2-35-154-163-68.ap-south-1.compute.amazonaws.com" "ec2-35-154-81-120.ap-south-1.compute.amazonaws.com" "ec2-13-126-36-16.ap-south-1.compute.amazonaws.com" "ec2-52-66-176-112.ap-south-1.compute.amazonaws.com" "ec2-52-66-184-223.ap-south-1.compute.amazonaws.com")


#array that stores the publicIpv4
#declare -a publicIpv4=("13.126.40.180" "13.126.15.102" "52.66.188.114" "35.154.61.167" "52.66.140.164" "52.66.64.51" "13.126.16.197" "35.154.59.104" "52.66.87.25" "35.154.232.3" "35.154.163.68" "35.154.81.120" "13.126.36.16" "52.66.176.112" "52.66.184.223")

declare -a publicIpv4=( "35.154.249.42" "52.66.86.126" "13.126.40.249" "52.66.147.61" "35.154.21.98" "13.126.40.180" "13.126.15.102" "52.66.188.114" "35.154.61.167" "52.66.140.164" "52.66.64.51" "13.126.16.197" "35.154.59.104" "52.66.87.25" "35.154.232.3" "35.154.163.68" "35.154.81.120" "13.126.36.16" "52.66.176.112" "52.66.184.223")


## now loop through the above array
for i in ${!publicIp[*]};
do
   #echo "${publicIp[$index]} is Public DNS of  ${publicIpv4[$index]}"
   # or do whatever with individual element of the array
address=$address1${publicIp[$i]}
echo $address


#The below command runs the script on the AWS instance.
ssh -oStrictHostKeyChecking=no -i $fname $address "bash -s" -- < $peerScriptPath
#copies the config.BPL.ip.json on AWS instance
#NEED CHANGESD
scp -oStrictHostKeyChecking=no -i $fname $configFilePath$configFileFirstPart${publicIpv4[$i]}$configFileLastPart $address:/home/ubuntu/BPL-node/


ssh -oStrictHostKeyChecking=no -i $fname $address "bash -s" -- < $attach

echo  "DONE DONE ********************************************************************************************************"
done
