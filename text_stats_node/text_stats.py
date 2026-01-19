#!/usr/bin/python3
# SPDX-FileCopyrightText: Ruka Ishikawa
# SPDX-License-Identifier: BSD-3-Clause

import rclpy
from rclpy.node import Node
from std_msgs.msg import String

class TextStatsNode(Node):
    def __init__(self):
        super().__init__('text_stats_node')

        # Subscriber の作成
        self.sub = self.create_subscription(
            String,
            'input_text',
            self.callback,
            10
        )

    def callback(self, msg):
        # 受信したデータをログに出すだけ
        self.get_logger().info(f"Received text: {msg.data}")


def main():
    rclpy.init()
    node = TextStatsNode()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()

