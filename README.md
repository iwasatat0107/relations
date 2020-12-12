# Re:lations
![relations_logo](https://user-images.githubusercontent.com/72957556/101978379-cf43fe00-3c97-11eb-8167-071b16428f7a.png)
 
## Overview
 **対人関係で幸せになるアプリケーション**
 
 ![relations_top](https://user-images.githubusercontent.com/72957556/101978453-6e68f580-3c98-11eb-96e7-3a9e16bbe2bf.png)


## 概要
 新しい仕事を始める時・初対面の人と話す時・初めての会議など、さまざまなシーンで活用できる。
アドラー心理学では、人間の悩みは、全て、対人関係の悩みであると言われてる。
人間の悩みを深く探求していくと、根本的なところは、全て、対人関係の悩みに行き着く。
相手を正しく知ることにより、信頼してもらいやすくなると同時に、健全な対人関係を構築できる。
また、自分をメタ認知して、きちんと反復練習をすれば、誰でも人を惹きつけることができる。
対人関係を正しく構築できれば、この世界は、幸せで満ちていることに気づけるのではないか。
 
## URL
 
![デモ](https://)
 
## ペルソナ
30代
男性
営業職
趣味はゴルフ・ランニング・お酒
妻・娘2人
在宅のリモートワークが週に２回程

## 目指した課題解決

リモートでの面談が増え、社会的にも名刺交換の機会が減り、相手の顔と名前がおぼえられない。
前回話して盛り上がった内容が思い出せない。
直前まで話そうと考えていた、些細な話題を忘れてしまう。
初対面だと、雑談のネタや話題が思いつかない。

## 洗い出した要件
相手の話に心から傾聴し、相手から信頼してもらいやすくなる。
相手に呼びかける時に、顔と名前、漢字の正しい読み方が分からなくて失礼な対応になりかねない場合がある。
多くの取引先がいると、各相手との共通の話題を思い出せなくなくなる。
現実のコミュニケーションだと下記のように、共通の話題も見つかりやすい。
天気、経路、近くの美味しいお店、身につけてる物、相手の仕草...etc
しかし、オンライン上では突発的な雑談やコミュニケーションが生まれにくい。
2〜3回の対話だと何を話していいか分からなくなり、沈黙や気まずい空気になる。

## 実装した機能
顔と名前と漢字の読み方がひと目で分かる機能。
話した日付と内容を記録できる機能。
今日が何の日か分かる機能。
傾聴できているかセルフチェックする振り返り機能。
・笑顔をつくる。　　　自然に口角をあげ、相手の目を見る。
・相槌を打つ。　　　　相手が話しやすいように。
・共感する。　　　　　相手の立場に立って想像力を働かせる。
・リアクションする。　反応すべきところは反応する。
・質問する。　　　　　相手より話しすぎないよう、話を引き出す。

## 実装予定の機能
クライアントの誕生日の前日と当日にポップアップが表示される機能。

## データベース設計

![relations](https://user-images.githubusercontent.com/72957556/100700575-20730880-33e1-11eb-9b51-56ac6dbc472e.jpeg)


# テーブル設計

## users テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| name               | string     | null: false |
| email              | string     | null: false |
| encrypted_password | string     | null: false |


### Association

- has_many  :clients
- has_many  :memos
- has_many  :checks


## clients テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| last_name          | string     | null: false                   |
| first_name         | string     | null: false                   |
| last_name_kana     | string     | null: false                   |
| first_name_kana    | string     | null: false                   |
| company            | string     |                               |
| prefecture_id      | integer    |                               | 
| birthday           | date       |                               |
| user_id            | references | null: false, foreign_key:true |

### Association

- belongs_to  :user
- has_many    :checks
- has_one     :memo


## checks テーブル

| Column            | Type        | Options                        |
| --------------    | ----------- | ------------------------------ |
| title             | string      | null: false                    |
| user_id           | references  | null: false, foreign_key:true  |
| client_id         | references  | null: false, foreign_key:true  |
| smile_id          | integer     |                                |
| aizuchi_id        | integer     |                                |
| empathy_id        | integer     |                                |
| reaction_id       | integer     |                                |
| question_id       | integer     |                                |

### Association

- belongs_to  :user
- belongs_to  :client


## memos テーブル

| Column            | Type       | Options                         |
| ----------------- | ---------- | ------------------------------- |
| user_id           | references | null: false, foreign_key:true   |
| client_id         | references | null: false, foreign_key:true   |
| text              | text       | null: false,                    | 


### Association

- belongs_to :user
- has_one :client


## favorites テーブル

| Column            | Type       | Options                         |
| ----------------- | ---------- | ------------------------------- |
| user_id           | references | null: false, foreign_key:true   |
| client_id         | references | null: false, foreign_key:true   |


### Association

- belongs_to :user
- has_one :client

## 使用技術・言語
フロントエンド(javascript, jQuery, HTML/CSS, Sass)
バックエンド(Ruby on Rails6.0 )
テスト(RSpec, FactoryBot)
データベース(Sequel Pro)
開発環境(MacOS, VScode, Git, GitHub)

## 作者
 
[Tatsuhiro Iwasaki](https://iwasatat.com/)
mail to: it.was07@gmail.com
