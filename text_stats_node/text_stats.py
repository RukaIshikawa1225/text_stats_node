#!/usr/bin/python3
# SPDX-FileCopyrightText: Ruka Ishikawa
# SPDX-License-Identifier: BSD-3-Clause

import rclpy
from rclpy.node import Node
from std_msgs.msg import String
from std_msgs.msg import Int32MultiArray


class TextStatsNode(Node):
    def __init__(self):
        super().__init__('text_stats_node')

        # Subscriber
        self.sub = self.create_subscription(
            String,
            'input_text',
            self.callback,
            10
        )

        # Publisher
        self.pub = self.create_publisher(
            Int32MultiArray,
            'text_stats',
            10
        )

    def callback(self, msg):
        
        text = msg.data

        char_count = len(text)
        word_count = len(text.split())

        out = Int32MultiArray()
        out.data = [char_count, word_count]

        self.pub.publish(out)


def main():
    rclpy.init()
    node = TextStatsNode()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()

