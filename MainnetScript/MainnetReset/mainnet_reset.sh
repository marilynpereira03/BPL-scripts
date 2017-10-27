#!/bin/bash
#kill node process
pkill -9 node

#drop database
dropdb bpl_mainnet
#create database
createdb bpl_mainnet
#move to BPL-node directory
cd BPL-node
#command to start node
npm run start:bplmainnet > logs/bpl_node.log 2>&1 &
