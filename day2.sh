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

## tweet sized
echo "p1"
awk '/^u/ {d-=$2} /^d/ {d+=$2} /^f/ {h+=$2} END {print d*h}' day2.input

echo "p2"
awk '/^u/ {a-=$2} /^d/ {a+=$2} /^f/ {h+=$2;d+=a*$2} END {print d*h}' day2.input
