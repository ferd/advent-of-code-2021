#!/usr/bin/env bash

echo "part 1"
awk 'prev != "" && prev < $1 { incr+=1; } {prev = $1} END { print incr }' day1.input

echo "part 2"
awk \
 '# initialization steps
  a == "" { a=$0; next;}
  b == "" {b=a; a=$0; next}
  c == "" {c=b; b=a; a=$0; next}
  # calculate sliding window
  {prev=a+b+c; c=b; b=a; a=$0}
  # count if the increment is larger
  a+b+c > prev { incr+=1 }
  END {print incr}' \
  day1.input
