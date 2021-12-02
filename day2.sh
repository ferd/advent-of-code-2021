#!/usr/bin/env bash

echo "part 1"
awk '
/up/ {d-=$2}
/down/ {d+=$2}
/forward/ {h+=$2}
END {print d*h}
' day2.input

echo "part 2"
awk '
/up/ {aim-=$2}
/down/ {aim+=$2}
/forward/ {h+=$2; d+=aim*$2}
END {print d*h}
' day2.input
