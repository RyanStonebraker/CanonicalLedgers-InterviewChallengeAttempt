# CanonicalLedgers-InterviewChallengeAttempt
Command line script for counting the volume of factoids between a start and end block height.

## Timeline:
- 6:45pm - 7:17pm: Read the challenge and looked at documentation
- 7:40pm - 7:55pm: Successfully got a returned JSON request for a specified block height by using courtesy-node.factom.com/v2
- 7:55pm - 9:06pm: Got a working implementation of the coding challenge
- 9:06 - 9:30pm: Commented code and filled out readme

Total: ~1 hour 30 mins of working
## Dependencies:
- curl
- awk
- jq

## Installation Instructions:
The only non-standard dependency used is jq. This is used for parsing the returned json text and is available from brew on mac, apt on ubuntu, and most other package managers. More information on jq can be found [here](https://stedolan.github.io/jq/).

## Running:
To run the script, simply execute it from bash followed by the beginning block height and then the ending block height.

## Example Usage:
```sh
$ ./factoid_count.sh 139960 139966
Factoid Volume: 121.012
```
