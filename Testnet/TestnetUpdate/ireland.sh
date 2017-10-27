#Each script starts with a shebang and the path to the shell that you want to use. shebang is '#!'
#!/bin/bash

attach=testnet_update.sh
configFileFirstPart="/config.BPL-testnet."
configFileLastPart=".json"
fname="blockpool_ireland.pem"
address1="ubuntu@"
chmod 400 $fname

#array that storest the Public DNS IPv4
declare -a publicIp=( "ec2-54-246-214-229.eu-west-1.compute.amazonaws.com" "ec2-176-34-156-16.eu-west-1.compute.amazonaws.com" "ec2-54-154-120-195.eu-west-1.compute.amazonaws.com" "ec2-176-34-153-112.eu-west-1.compute.amazonaws.com" "ec2-54-154-227-162.eu-west-1.compute.amazonaws.com" "ec2-54-154-209-143.eu-west-1.compute.amazonaws.com" "ec2-54-194-71-103.eu-west-1.compute.amazonaws.com" "ec2-54-154-130-173.eu-west-1.compute.amazonaws.com" "ec2-54-194-150-18.eu-west-1.compute.amazonaws.com" "ec2-54-246-176-39.eu-west-1.compute.amazonaws.com" "ec2-54-171-82-35.eu-west-1.compute.amazonaws.com" "ec2-54-194-98-230.eu-west-1.compute.amazonaws.com" "ec2-54-154-31-62.eu-west-1.compute.amazonaws.com" "ec2-54-194-232-186.eu-west-1.compute.amazonaws.com" "ec2-54-229-213-96.eu-west-1.compute.amazonaws.com" "ec2-34-253-181-52.eu-west-1.compute.amazonaws.com" "ec2-54-154-52-224.eu-west-1.compute.amazonaws.com" "ec2-54-194-126-232.eu-west-1.compute.amazonaws.com" "ec2-54-246-187-20.eu-west-1.compute.amazonaws.com" "ec2-54-77-251-239.eu-west-1.compute.amazonaws.com")

#array that stores the publicIpv4
declare -a publicIpv4=("54.246.214.229" "176.34.156.16" "54.154.120.195" "176.34.153.112" "54.154.227.162" "54.154.209.143" "54.194.71.103" "54.154.130.173" "54.194.150.18" "54.246.176.39" "54.171.82.35" "54.194.98.230" "54.154.31.62" "54.194.232.186" "54.229.213.96" "34.253.181.52" "54.154.52.224" "54.194.126.232" "54.246.187.20" "54.77.251.239" )



## now loop through the above array
for i in ${!publicIp[*]};
do
   #echo "${publicIp[$index]} is Public DNS of  ${publicIpv4[$index]}"
   # or do whatever with individual element of the array
address=$address1${publicIp[$i]}
echo $address

ssh -oStrictHostKeyChecking=no -i $fname $address "bash -s" -- < $attach

echo  "DONE DONE ********************************************************************************************************"
done
