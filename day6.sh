#!/usr/bin/bash

echo "part 1"
awk -f day6.awk -v DAYS=80 day6.input

echo "part 2"
awk -f day6.awk -v DAYS=256 day6.input
