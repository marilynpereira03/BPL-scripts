#Each script starts with a shebang and the path to the shell that you want to use. shebang is '#!'
#!/bin/bash

##Different paths that we will be using in our script
temp=testnet_stop.sh
fname="blockpool_oregon_debian.pem"
address1="admin@"
chmod 400 $fname

#array that storest the Public DNS IPv4
declare -a publicIp=( "ec2-34-211-111-67.us-west-2.compute.amazonaws.com" "ec2-54-245-71-170.us-west-2.compute.amazonaws.com" "ec2-34-211-45-169.us-west-2.compute.amazonaws.com" "ec2-54-149-149-148.us-west-2.compute.amazonaws.com" "ec2-34-223-253-150.us-west-2.compute.amazonaws.com" "ec2-54-245-130-155.us-west-2.compute.amazonaws.com" "ec2-54-214-216-253.us-west-2.compute.amazonaws.com" "ec2-54-202-59-244.us-west-2.compute.amazonaws.com" "ec2-54-214-217-205.us-west-2.compute.amazonaws.com" "ec2-54-213-211-189.us-west-2.compute.amazonaws.com" "ec2-54-187-219-253.us-west-2.compute.amazonaws.com" "ec2-54-187-112-30.us-west-2.compute.amazonaws.com" "ec2-54-213-181-202.us-west-2.compute.amazonaws.com" "ec2-54-202-237-182.us-west-2.compute.amazonaws.com" "ec2-34-211-45-189.us-west-2.compute.amazonaws.com" "ec2-54-187-25-125.us-west-2.compute.amazonaws.com" "ec2-34-212-136-84.us-west-2.compute.amazonaws.com" "ec2-34-211-50-238.us-west-2.compute.amazonaws.com" "ec2-54-191-165-110.us-west-2.compute.amazonaws.com" "ec2-34-212-121-246.us-west-2.compute.amazonaws.com" )

#array that stores the publicIpv4
declare -a publicIpv4=( "34.211.111.67" "54.245.71.170" "34.211.45.169" "54.149.149.148" "34.223.253.150" "54.245.130.155" "54.214.216.253" "54.202.59.244" "54.214.217.205" "54.213.211.189" "54.187.219.253" "54.187.112.30" "54.213.181.202" "54.202.237.182" "34.211.45.189" "54.187.25.125" "34.212.136.84" "34.211.50.238" "54.191.165.110" "34.212.121.246" )


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
