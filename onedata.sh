#!/bin/bash

#第一次取新数据
olddata103=$(curl -s --data-binary '{"jsonrpc":"2.0","id":"curltext","method":"eth_blockNumber","params":[]}' -H 'content-type:application/json;' http://172.31.95.103:8545 | jq .result)
olddata162=$(curl -s --data-binary '{"jsonrpc":"2.0","id":"curltext","method":"eth_blockNumber","params":[]}' -H 'content-type:application/json;' http://172.31.95.162:8545 | jq .result)
olddata132=$(curl -s --data-binary '{"jsonrpc":"2.0","id":"curltext","method":"eth_blockNumber","params":[]}' -H 'content-type:application/json;' http://172.31.95.132:8545 | jq .result)
olddata144=$(curl -s --data-binary '{"jsonrpc":"2.0","id":"curltext","method":"eth_blockNumber","params":[]}' -H 'content-type:application/json;' http://172.31.95.144:8545 | jq .result)

#json存数组
olddata=($olddata103 $olddata162 $olddata132 $olddata144)

#去引号
oldnum=($(echo ${olddata[0]} | sed 's/\"//g') $(echo ${olddata[1]} | sed 's/\"//g') $(echo ${olddata[2]} | sed 's/\"//g') $(echo ${olddata[3]} | sed 's/\"//g'))
