#Each script starts with a shebang and the path to the shell that you want to use. shebang is '#!'
#!/bin/bash

GIT_CLONE_PATH=https://github.com/blockpool-io/BPL-node.git

#Basic installations
sudo apt-get install git
#kill  a node process
pkill -9 node
#remove BPL
rm -rf BPL-node
#Clones the repository
echo -e "Clonning the repository $GIT_CLONE_PATH\n"
git clone $GIT_CLONE_PATH
#Change directory to BPL-node
echo -e "Change directory to BPL-node\n"
cd BPL-node
#Change the git branch
git checkout bpl-mainnet


#Install it to avoid error
echo -e "Avoiding future errors by installing libpq-dev\n"
sudo apt-get -y update
sudo apt-get install -y libpq-dev


#Developer installations
#Install essentials:
echo -e "Install essentials:\n"
sudo apt-get install -y curl build-essential python git
#Install PostgreSQL (min version: 9.5.2)
echo -r "Install PostgreSQL (min version: 9.5.2)\n"
sudo apt-get install -y postgresql-9.5
sudo -u postgres createuser --createdb $USER

#Since the AWS instances do not have npm installed already thus we are installing it as further installations are done using npm
echo -e "Since the AWS instances do not have npm installed already thus we are installing it as further installations are done using npm\n"
sudo apt-get -y install npm
#Install Node.js (tested with version 6.9.2, but any recent LTS release should do):
echo -e "Install Node.js (tested with version 6.9.2, but any recent LTS release should do):\n"
sudo apt-get install -y nodejs
sudo npm install -g n
sudo n 6.9.2
#Install grunt-cli (globally):
echo -e "#Install grunt-cli (globally):\n"
sudo npm install grunt-cli -g
#Install node modules:
echo -e "#Install node modules:\n"
npm install libpq secp256k1
npm install
echo -e "Dropping database"
dropdb bpl_mainnet
echo -e "Creating database"
createdb bpl_mainnet


