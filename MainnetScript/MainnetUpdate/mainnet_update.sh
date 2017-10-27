#!/bin/bash
#kill node
pkill -9 node
cd BPL-node
git checkout bpl-mainnet
mv config.mainnet.json config.mainnet.backup.json
git checkout genesisBlock.mainnet.json
git checkout config.mainnet.json
git pull origin bpl-mainnet
mv config.mainnet.backup.json config.mainnet.json
npm install
#run node at background
forever start app.js -c config.mainnet.json -g genesisBlock.mainnet.json

