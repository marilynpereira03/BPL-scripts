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
fname="blockpool_frankfurt.pem"
address1="ubuntu@"
chmod 400 $fname

#array that storest the Public DNS IPv4
declare -a publicIp=("ec2-54-93-85-178.eu-central-1.compute.amazonaws.com" "ec2-52-59-220-4.eu-central-1.compute.amazonaws.com" "ec2-54-93-33-249.eu-central-1.compute.amazonaws.com" "ec2-52-59-192-14.eu-central-1.compute.amazonaws.com" "ec2-54-93-223-14.eu-central-1.compute.amazonaws.com" "ec2-52-59-242-251.eu-central-1.compute.amazonaws.com" "ec2-52-59-238-170.eu-central-1.compute.amazonaws.com" "ec2-54-93-185-138.eu-central-1.compute.amazonaws.com" "ec2-54-93-40-230.eu-central-1.compute.amazonaws.com" "ec2-54-93-197-134.eu-central-1.compute.amazonaws.com" "ec2-54-93-66-55.eu-central-1.compute.amazonaws.com" "ec2-54-93-111-125.eu-central-1.compute.amazonaws.com" "ec2-35-158-121-214.eu-central-1.compute.amazonaws.com" "ec2-35-158-125-242.eu-central-1.compute.amazonaws.com" "ec2-54-93-225-141.eu-central-1.compute.amazonaws.com" "ec2-52-59-246-242.eu-central-1.compute.amazonaws.com" "ec2-52-59-255-126.eu-central-1.compute.amazonaws.com" "ec2-54-93-249-69.eu-central-1.compute.amazonaws.com" "ec2-54-93-114-197.eu-central-1.compute.amazonaws.com" "ec2-52-59-253-240.eu-central-1.compute.amazonaws.com" )

#array that stores the publicIpv4
declare -a publicIpv4=( "54.93.85.178" "52.59.220.4" "54.93.33.249" "52.59.192.14" "54.93.223.14" "52.59.242.251" "52.59.238.170" "54.93.185.138" "54.93.40.230" "54.93.197.134" "54.93.66.55" "54.93.111.125" "35.158.121.214" "35.158.125.242" "54.93.225.141" "52.59.246.242" "52.59.255.126" "54.93.249.69" "54.93.114.197"  "52.59.253.240" )


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
