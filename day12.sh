#!/usr/bin/env bash

echo "part1"
awk -f day12.awk -v ALLOW_DUP=0 day12.input

echo "part2"
awk -f day12.awk -v ALLOW_DUP=1 day12.input
