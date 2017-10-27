#Each script starts with a shebang and the path to the shell that you want to use. shebang is '#!'
#!/bin/bash

##Different paths that we will be using in our script
temp=testnet_reset.sh
fname="blockpool_verginia_debian.pem"
address1="admin@"
chmod 400 $fname

#array that storest the Public DNS IPv4
declare -a publicIp=( "ec2-54-175-122-162.compute-1.amazonaws.com" "ec2-54-236-7-248.compute-1.amazonaws.com" "ec2-34-229-92-173.compute-1.amazonaws.com" "ec2-54-236-20-136.compute-1.amazonaws.com" "ec2-54-146-99-28.compute-1.amazonaws.com" "ec2-34-203-200-109.compute-1.amazonaws.com" "ec2-54-87-144-172.compute-1.amazonaws.com" "ec2-184-72-76-93.compute-1.amazonaws.com" "ec2-34-226-208-184.compute-1.amazonaws.com" "ec2-34-229-86-76.compute-1.amazonaws.com" "ec2-34-229-177-170.compute-1.amazonaws.com" "ec2-34-230-87-62.compute-1.amazonaws.com" "ec2-54-86-125-61.compute-1.amazonaws.com" "ec2-52-90-128-204.compute-1.amazonaws.com" )

#array that stores the publicIpv4
declare -a publicIpv4=( "54.175.122.162" "54.236.7.248" "34.229.92.173" "54.236.20.136" "54.146.99.28" "34.203.200.109" "54.87.144.172" "184.72.76.93" "34.226.208.184" "34.229.86.76" "34.229.177.170" "34.230.87.62" "54.86.125.61" "52.90.128.204" )


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
