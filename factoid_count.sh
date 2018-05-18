getRawBlockHeightJSON() {
  curl -s POST --data-binary '{"jsonrpc": "2.0", "id": 0, "method":"fblock-by-height", "params": {"height":'$1'}}'  -H 'content-type:text/plain;' http://courtesy-node.factom.com/v2
}

getBlockInputs() {
  getRawBlockHeightJSON $1 | jq -r '.result.fblock.transactions | ..[]?.inputs[].amount'
}

getFactoidRangeList() {
  for i in `seq $1 $2`;
  do
    getBlockInputs $i 2> /dev/null
  done
}

sumList=$(getFactoidRangeList $1 $2)
echo "$sumList" | awk '{total+=$1} END {print "Factoid Volume: "total*10^-8}'
