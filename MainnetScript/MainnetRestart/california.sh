#Each script starts with a shebang and the path to the shell that you want to use. shebang is '#!'
#!/bin/bash
#script to stop BPL-nodes
temp=mainnet_restart.sh

#need changes here
configFileFirstPart="/config.BPL-mainnet."
configFileLastPart=".json"

fname="BPL_MC.pem"
address1="ubuntu@"
chmod 400 $fname

declare -a publicIp=(
"ec2-13-56-163-57.us-west-1.compute.amazonaws.com"
"ec2-54-183-132-15.us-west-1.compute.amazonaws.com"
"ec2-54-183-69-30.us-west-1.compute.amazonaws.com"
"ec2-54-183-152-67.us-west-1.compute.amazonaws.com"
"ec2-54-183-22-145.us-west-1.compute.amazonaws.com"
"ec2-54-183-209-94.us-west-1.compute.amazonaws.com"
"ec2-54-153-89-97.us-west-1.compute.amazonaws.com"
"ec2-54-153-120-24.us-west-1.compute.amazonaws.com"
"ec2-54-67-117-224.us-west-1.compute.amazonaws.com"
"ec2-54-241-156-232.us-west-1.compute.amazonaws.com"
"ec2-54-193-61-26.us-west-1.compute.amazonaws.com"
"ec2-54-67-92-59.us-west-1.compute.amazonaws.com"
"ec2-54-67-7-8.us-west-1.compute.amazonaws.com"
"ec2-54-193-96-185.us-west-1.compute.amazonaws.com"
"ec2-54-193-74-250.us-west-1.compute.amazonaws.com"
"ec2-54-67-93-228.us-west-1.compute.amazonaws.com"
"ec2-54-183-21-26.us-west-1.compute.amazonaws.com"
"ec2-54-153-44-24.us-west-1.compute.amazonaws.com"
"ec2-54-241-140-106.us-west-1.compute.amazonaws.com"
"ec2-54-153-117-209.us-west-1.compute.amazonaws.com"
)

declare -a publicIpv4=(
"13.56.163.57"
"54.183.132.15"
"54.183.69.30"
"54.183.152.67"
"54.183.22.145"
"54.183.209.94"
"54.153.89.97"
"54.153.120.24"
"54.67.117.224"
"54.241.156.232"
"54.193.61.26"
"54.67.92.59"
"54.67.7.8"
"54.193.96.185"
"54.193.74.250"
"54.67.93.228"
"54.183.21.26"
"54.153.44.24"
"54.241.140.106"
"54.153.117.209"
)

## now loop through the above array
for i in ${!publicIp[*]};
do
address=$address1${publicIp[$i]}
#Execute stop script on AWS
ssh -oStrictHostKeyChecking=no -i $fname $address "bash -s" -- < $temp
done
