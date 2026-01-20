#!/bin/bash
# SPDX-FileCopyrightText: 2026 Ruka Ishikawa
# SPDX-License-Identifier: BSD-3-Clause

set -e

# このスクリプトのあるディレクトリ
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# ワークスペースのルート（ros2_ws）
WS_DIR="$(cd "$SCRIPT_DIR/../../.." && pwd)"

# ROS 2 環境を自動判別
if [ -f /opt/ros/humble/setup.bash ]; then
  source /opt/ros/humble/setup.bash
elif [ -f /opt/ros/foxy/setup.bash ]; then
  source /opt/ros/foxy/setup.bash
elif [ -f /opt/ros/galactic/setup.bash ]; then
  source /opt/ros/galactic/setup.bash
else
  echo "ROS 2 environment not found"
  exit 1
fi

# colcon build 後の環境
source "$WS_DIR/install/setup.bash"

echo "START node"
ros2 run text_stats_node text_stats &
NODEPID=$!

sleep 5

echo "PUBLISH"
ros2 topic pub --once /input_text std_msgs/String "data: hello world"

echo "ECHO"
timeout 10 ros2 topic echo /text_stats | head -n 1

echo "KILL"
kill $NODEPID

