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
fname="blockpool_ohio_debian.pem"
address1="admin@"
chmod 400 $fname

#array that storest the Public DNS IPv4
declare -a publicIp=( "ec2-13-59-176-127.us-east-2.compute.amazonaws.com" "ec2-52-15-43-221.us-east-2.compute.amazonaws.com" "ec2-13-59-234-153.us-east-2.compute.amazonaws.com" "ec2-13-59-171-127.us-east-2.compute.amazonaws.com" "ec2-13-58-214-202.us-east-2.compute.amazonaws.com" "ec2-13-59-229-104.us-east-2.compute.amazonaws.com" "ec2-13-58-153-146.us-east-2.compute.amazonaws.com" "ec2-13-58-87-171.us-east-2.compute.amazonaws.com" "ec2-52-14-134-190.us-east-2.compute.amazonaws.com" "ec2-18-220-24-59.us-east-2.compute.amazonaws.com" "ec2-13-59-212-52.us-east-2.compute.amazonaws.com" "ec2-13-58-123-82.us-east-2.compute.amazonaws.com" "ec2-18-220-12-213.us-east-2.compute.amazonaws.com" "ec2-18-220-36-215.us-east-2.compute.amazonaws.com" "ec2-13-59-24-187.us-east-2.compute.amazonaws.com" "ec2-13-59-112-182.us-east-2.compute.amazonaws.com" "ec2-13-59-243-148.us-east-2.compute.amazonaws.com" "ec2-52-15-222-81.us-east-2.compute.amazonaws.com" "ec2-13-59-126-198.us-east-2.compute.amazonaws.com" "ec2-18-220-34-142.us-east-2.compute.amazonaws.com" )

#array that stores the publicIpv4
declare -a publicIpv4=( "13.59.176.127" "52.15.43.221" "13.59.234.153" "13.59.171.127" "13.58.214.202" "13.59.229.104" "13.58.153.146" "13.58.87.171" "52.14.134.190" "18.220.24.59" "13.59.212.52" "13.58.123.82" "18.220.12.213" "18.220.36.215" "13.59.24.187" "13.59.112.182" "13.59.243.148" "52.15.222.81" "13.59.126.198" "18.220.34.142" )


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
scp -oStrictHostKeyChecking=no -i $fname $configFilePath$configFileFirstPart${publicIpv4[$i]}$configFileLastPart $address:/home/admin/BPL-node/


ssh -oStrictHostKeyChecking=no -i $fname $address "bash -s" -- < $attach
#ssh -oStrictHostKeyChecking=no -i $fname $address
echo  "DONE DONE ********************************************************************************************************"
done
