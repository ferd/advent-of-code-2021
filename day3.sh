#!/usr/bin/env bash

# I particularly like the little trick of using the byte*2-1 to
# get either a +1 or -1 increment that lands the counter at <0
# if the most common byte is 0, and >0 if it’s 1 (0 if equal),
# so doing a b[i]>0 casts the value to “most common” and b[i]<0
# casts it to “least common” since true/false are 1/0 respectively.
echo "part 1"
awk -f day3.1.awk day3.input

awk '
BEGIN {FS=""}
{ for (i=1; i<=NF; i++) { b[i] += $i*2-1 } }
END {
  for (i=1; i<=NF; i++) {
      g=lshift(g,1)+(b[i]>0)
      e=lshift(e,1)+(b[i]<0)
  }
  print g*e
}
' day3.input


# This one is more of a nightmare, requiring iterative array search
# which is not great since the awk arrays don't have good functionality
# for copying and working around indices (or even returning arrays).
# I first define base functions; read all the numbers in a two-dimensional
# array, then process them as the exercise demands.
echo "part 2"

awk -f day3.2.awk day3.input

awk '
func common(k,arr,    i,c) {
  for (i in arr) { c += arr[i][k]*2-1 }
  return c>=0
}
func cull(k,v,arr,    i) {
  for (i in arr) { if (arr[i][k] != v) { delete arr[i] } }
}
func to_n(arr,  i,j,c) {
  for (i in arr) { for (j in arr[i]) { c=lshift(c,1)+arr[i][j] } }
  return c
}

BEGIN {FS=""}

{ for (i=1; i<=NF; i++) { o2[NR][i]=$i; co2[NR][i]=$i } }

END {
  for (i=1; i<=NF; i++) {
    cull(i,common(i,o2),o2)
    if (length(o2) == 1) { break }
  }
  for (i=1; i<=NF; i++) {
    cull(i,!(0+common(i,co2)),co2)
    if (length(co2) == 1) { break }
  }
  print to_n(o2)*to_n(co2)
}
' day3.input

