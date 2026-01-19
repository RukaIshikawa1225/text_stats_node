# text_stats_node

## 概要
他のROS 2ノードが送信する文字列を受け取り，
文字数と単語数を計算して別トピックに出力するROS 2パッケージです。

## ノードとトピック

### ノード
- text_stats

### Subscribe
- /input_text (std_msgs/String)

### Publish
- /text_stats (std_msgs/Int32MultiArray)
  - data[0]: 文字数
  - data[1]: 単語数

## 使い方

```bash
ros2 run text_stats_node text_stats
```
