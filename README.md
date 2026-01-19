# text_stats_node

## 概要
'text_stats_node' は、**ROS 2 のトピック通信を用いて、
外部ノードから受信した文字列データを解析し、
文字数や単語数といった簡単な統計情報を別トピックに
publish する ROS 2 パッケージ**です。

他の ROS 2 パッケージと組み合わせて利用することを想定しており、
文字列データを扱うノードの前処理・可視化補助などに利用できます。

---
## 特徴
- ROS2のトピック通信を利用
- 外部ノードから文字列データを受信
- 文字数・単語数を計算してpublish
- 標準メッセージ型のみを使用(追加ライブラリ不要)
- bashによる外部入出力テストを実装
- GitHub Actionsによる自動テストに対応

---

## 動作環境
- Linux (Ubuntu 20.04でローカル動作確認済み)
- ROS 2 (Humble/ Foxy/ Galactic)
- Ubuntu 22.04(GitHub ActionsによるCI環境)

標準のROS2パッケージのみを使用しており、追加の外部ライブラリは不要です。

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

## インストール
```bash
git clone https://github.com/RukaIshikawa1225/text_stats_node.git
cd text_stats_node
```
ROS2のワークスペースの'src'のディレクトリに配置してビルドしてください。
```bash
colcon build
source install/setup.bash
```

---

## 使い方


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

## テスト
本パッケージでは、ROS 2 の外部入出力を bash スクリプトから確認するテストを行っています。

```bash
./test/test.bash
```
正常終了時は終了ステータスは0になります。

```bash
echo $?

0
```

---

## GitHub Actions

本リポジトリではGitHub Actionsを用いて、push時に自動でビルド及びテストが実行されるよう設定しています。

---
## ライセンス
このソフトウェアは**BSD 3-Clause License**のもとで公開されています。
詳細は'LICESE'ファイルを参照してください。

---

## 著作権表示
```yaml
SPDX-FileCopyrightText: 2026 Ruka Ishikawa
SPDX-License-Identifier: BSD-3-Clause
```
