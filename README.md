# text_stats_node

## 概要
`text_stats_node`は、ROS 2 のトピック通信を用いて、
外部ノードから受信した文字列データを解析し、
文字数や単語数といった簡単な統計情報を別トピックに
publish する ROS 2 パッケージです。

他の ROS 2 パッケージと組み合わせて利用することを想定しており、
文字列データを扱うノードの前処理・可視化補助などに利用できます。

---

## 動作環境
- Linux (Ubuntu 20.04でローカル動作確認済み)
- ROS 2 (Humble/ Foxy/ Galactic)
- Ubuntu 22.04 (GitHub ActionsによるCI環境)

標準のROS 2パッケージのみを使用しており、追加の外部ライブラリは不要です。

---

## ノード・トピック一覧

### ノード
- `text_stats`

### 入力トピック
- `/input_text`
  - 型: `std_msgs/msg/String`
  - 説明: 解析対象となる文字列データ

### 出力トピック
- `/text_stats`
  - 型: `std_msgs/msg/Int32MultiArray`
  - 説明: 文字数・単語数などの統計情報

---

## 使い方

### ビルド
```bash
colcon build
source install/setup.bash
```

### ノード起動
```bash
ros2 run text_stats_node text_stats
```

### 別端末から入力を送信
```bash
ros2 topic pub /input_text std_msgs/String "data: hello world"
```

### 出力の確認
```bash
ros2 topic echo /text_stats
```

### 出力例
```text
layout:
  dim: []
  data_offset: 0
data:
- 11
- 2
---
```

この例では：
- 文字数:11
- 単語数:2
が計算され、'Int32MultiArray'としてpublishされます。

---

## 著作権表示
- このソフトウェアは**BSD 3-Clause License**のもとで公開されています。
詳細は`LICENSE`ファイルを参照してください。

-　© 2026 Ruka Ishikawa 

---
