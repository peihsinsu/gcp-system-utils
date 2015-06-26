#!/bin/bash
# The scale 5000 will cost about 21 seconds in 1 core cpu 3.8G memory machine
while [ true ]; do echo "scale=5000; 4*a(1)" | bc -l -q; done
