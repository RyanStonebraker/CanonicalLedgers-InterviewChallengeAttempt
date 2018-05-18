# factoid_count.sh
# Ryan Stonebraker
# Coding Challenge for Canonical Ledgers

# Gets the JSON response for a single block
getRawBlockHeightJSON() {
  curl -s POST --data-binary '{"jsonrpc": "2.0", "id": 0, "method":"fblock-by-height", "params": {"height":'$1'}}'  -H 'content-type:text/plain;' http://courtesy-node.factom.com/v2
}

# Parses the JSON and returns a newline delimited list of input amounts for each transaction
getBlockInputs() {
  getRawBlockHeightJSON $1 | jq -r '.result.fblock.transactions | ..[]?.inputs[].amount'
}

# Takes a passed block range and creates a list of input amounts
# Sends errors to /dev/null
getFactoidRangeList() {
  for i in `seq $1 $2`;
  do
    getBlockInputs $i 2> /dev/null
  done
}

# Stores created list of input amounts between two passed heights into sumLists
# and then adds them all up and prints the total volume of factoids
sumList=$(getFactoidRangeList $1 $2)
echo "$sumList" | awk '{total+=$1} END {print "Factoid Volume: "total*10^-8}'
