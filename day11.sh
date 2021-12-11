#!/usr/bin/env bash

echo "part 1"
awk -f day11.1.awk -v STEPS=100 day11.input

echo "part 2"
awk -f day11.2.awk day11.input
