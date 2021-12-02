#!/usr/bin/env bash

echo "part 1"
awk 'prev != "" && prev < $1 { incr+=1; } {prev = $1} END { print incr }' day1.input

echo "part 2"
awk -f day1.2.awk day1.input

## tweet sized
echo "p1"
awk 'p!="" && p<$1 {i+=1;} {p=$1} END {print i}' day1.input

echo "p2"
awk '{p=a+b+c; c=b; b=a; a=$0;} a+b+c > p {i+=1} END {print i-3}' day1.input
