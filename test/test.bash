#!/bin/bash
set -e

# ROS 2 環境
source /opt/ros/humble/setup.bash
source install/setup.bash

# ノード起動
ros2 run text_stats_node text_stats &
NODEPID=$!

# 起動待ち
sleep 2

# 入力を1回送信
ros2 topic pub --once /input_text std_msgs/String "data: hello world"

# 出力を1回だけ受信して検査
ros2 topic echo /text_stats --once | grep -q "\[11, 2\]"

# ノード停止
kill $NODEPID

