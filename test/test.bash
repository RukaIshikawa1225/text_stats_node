#!/bin/bash
set -e

source ~/ros2_ws/install/setup.bash

# ノード起動
ros2 run text_stats_node text_stats &
NODEPID=$!

# ノードが立ち上がるのを待つ
sleep 3

# /text_stats トピックが存在することを確認
ros2 topic list | grep -q "/text_stats"

kill $NODEPID

