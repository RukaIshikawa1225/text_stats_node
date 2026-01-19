#!/bin/bash
set -e

source /opt/ros/humble/setup.bash
source ros2_ws/install/setup.bash

echo "START node"
ros2 run text_stats_node text_stats &
NODEPID=$!

sleep 3

echo "PUBLISH"
ros2 topic pub --once /input_text std_msgs/String "data: hello world"

echo "ECHO"
timeout 5 ros2 topic echo /text_stats | grep -m1 -q "11"

echo "KILL"
kill $NODEPID

