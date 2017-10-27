#Each script starts with a shebang and the path to the shell that you want to use. shebang is '#!'
#!/bin/bash
temp=mainnet_restart.sh
#need changes here
configFileFirstPart="/config.BPL-mainnet."
configFileLastPart=".json"

fname="BPL_MC_Oregon.pem"
address1="ubuntu@"
chmod 400 $fname

declare -a publicIp=(
"ec2-34-212-34-162.us-west-2.compute.amazonaws.com"
"ec2-54-202-206-227.us-west-2.compute.amazonaws.com"
"ec2-54-202-150-236.us-west-2.compute.amazonaws.com"
"ec2-54-203-87-49.us-west-2.compute.amazonaws.com"
"ec2-54-245-150-234.us-west-2.compute.amazonaws.com"
"ec2-54-186-230-45.us-west-2.compute.amazonaws.com"
"ec2-54-191-86-175.us-west-2.compute.amazonaws.com"
"ec2-34-212-31-213.us-west-2.compute.amazonaws.com"
"ec2-54-218-159-117.us-west-2.compute.amazonaws.com"
"ec2-34-212-30-116.us-west-2.compute.amazonaws.com"
"ec2-34-211-228-214.us-west-2.compute.amazonaws.com"
"ec2-34-212-82-55.us-west-2.compute.amazonaws.com"
"ec2-54-186-13-135.us-west-2.compute.amazonaws.com"
"ec2-54-202-194-76.us-west-2.compute.amazonaws.com"
"ec2-34-212-0-73.us-west-2.compute.amazonaws.com"
"ec2-54-202-119-251.us-west-2.compute.amazonaws.com"
"ec2-34-211-228-49.us-west-2.compute.amazonaws.com"
"ec2-34-209-90-25.us-west-2.compute.amazonaws.com"
"ec2-54-202-82-94.us-west-2.compute.amazonaws.com"
"ec2-54-186-154-168.us-west-2.compute.amazonaws.com"

)

declare -a publicIpv4=(
"34.212.34.162"
"54.202.206.227"
"54.202.150.236"
"54.203.87.49"
"54.245.150.234"
"54.186.230.45"
"54.191.86.175"
"34.212.31.213"
"54.218.159.117"
"34.212.30.116"
"34.211.228.214"
"34.212.82.55"
"54.186.13.135"
"54.202.194.76"
"34.212.0.73"
"54.202.119.251"
"34.211.228.49"
"34.209.90.25"
"54.202.82.94"
"54.186.154.168"
)

## now loop through the above array
for i in ${!publicIp[*]};
do
address=$address1${publicIp[$i]}
#Execute stop script on AWS
ssh -oStrictHostKeyChecking=no -i $fname $address "bash -s" -- < $temp
done
