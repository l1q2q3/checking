#!/bin/bash

#第二次取新数据
newdata103=$(curl -s --data-binary '{"jsonrpc":"2.0","id":"curltext","method":"eth_blockNumber","params":[]}' -H 'content-type:application/json;' http://172.31.95.103:8545 | jq .result)
newdata162=$(curl -s --data-binary '{"jsonrpc":"2.0","id":"curltext","method":"eth_blockNumber","params":[]}' -H 'content-type:application/json;' http://172.31.95.162:8545 | jq .result)
newdata132=$(curl -s --data-binary '{"jsonrpc":"2.0","id":"curltext","method":"eth_blockNumber","params":[]}' -H 'content-type:application/json;' http://172.31.95.132:8545 | jq .result)
newdata144=$(curl -s --data-binary '{"jsonrpc":"2.0","id":"curltext","method":"eth_blockNumber","params":[]}' -H 'content-type:application/json;' http://172.31.95.144:8545 | jq .result)

#json存数组
newdata=($newdata103 $newdata162 $newdata132 $newdata144)

#去引号
newnum=($(echo ${newdata[0]} | sed 's/\"//g') $(echo ${newdata[1]} | sed 's/\"//g') $(echo ${newdata[2]} | sed 's/\"//g') $(echo ${newdata[3]} | sed 's/\"//g'))
