#!/bin/bash
#kill node
pkill -9 node
cd BPL-node
git checkout testnet
mv config.testnet.json config.testnet.backup.json
git checkout genesisBlock.testnet.json
git checkout config.testnet.json
git pull origin testnet
mv config.testnet.backup.json config.testnet.json
npm install
#run node at background
npm run start:bpltestnet > logs/bpl_node.log 2>&1 &
