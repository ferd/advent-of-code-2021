#!/usr/bin/bash

echo "part 1"
awk -f day8.1.awk day8.input

echo "part 2"
#echo "acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf" | awk -f day8.2.awk
#awk -f day8.2.awk sample
awk -f day8.2.awk day8.input
