#!/bin/bash
#kill node process
pkill -9 node

#drop database
dropdb bpl_testnet
#create database
createdb bpl_testnet
#move to BPL-node directory
cd BPL-node
#command to start node
npm run start:bpltestnet > logs/bpl_node.log 2>&1 &
