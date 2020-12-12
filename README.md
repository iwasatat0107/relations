# Re:lations
![relations_logo](https://user-images.githubusercontent.com/72957556/101978379-cf43fe00-3c97-11eb-8167-071b16428f7a.png)
 
## Overview
 **対人関係で幸せになるアプリケーション**
 
![relations_rm_top](https://user-images.githubusercontent.com/72957556/101979299-47fa8880-3c9f-11eb-9aeb-cb7e5eee76b6.png)

## 概要
**オンラインの顧客カード管理アプリ**

 新しい仕事を始める時・初対面の人と話す時・初めての会議など、さまざまなシーンで活用できる。
アドラー心理学では、人間の悩みは、全て、対人関係の悩みであると言われてる。
人間の悩みを深く探求していくと、根本的なところは、全て、対人関係の悩みに行き着く。
相手を正しく知ることにより、信頼してもらいやすくなると同時に、健全な対人関係を構築できる。
また、自分をメタ認知して、きちんと反復練習をすれば、誰でも人を惹きつけることができる。
対人関係を正しく構築できれば、この世界は、幸せで満ちていることに気づけるのではないか。
 
 ![relations_rm_index](https://user-images.githubusercontent.com/72957556/101979216-8774a500-3c9e-11eb-869c-ea09e90f7d47.png)
 
## URL
 
![デモ](https://)

 
## ペルソナ
**30代男性**
営業職
趣味はゴルフ・ランニング・お酒
妻・娘2人
リモートワークが増加

## 目指した課題解決
**オンラインビジネスの対人関係の構築**

相手の顔と名前がおぼえられない。
前回話して盛り上がった内容が思い出せない。
直前まで話そうと考えていた、些細な話題を忘れてしまう。
初対面だと、雑談のネタや話題が思いつかない。

## 課題の背景
**リモート対面のビジネスが増えたこと**
オンライン上では突発的な雑談やコミュニケーションが生まれにくい。
2〜3回の対話だと何を話していいか分からなくなり、沈黙や気まずい空気になる。

## 洗い出した要件
**名刺交換やコミュニケーションの機会が減ったこと**

相手の顔と名前、漢字の正しい読み方が分からなくて失礼な対応になりかねない場合がある。
多くの取引先がいると、各相手との共通の話題を思い出せなくなくなる。
現実のコミュニケーションだと、共通の話題も見つかりやすい。
天気、経路、近くの美味しいお店、身につけてる物、相手の仕草...etc

![relations_nm_new](https://user-images.githubusercontent.com/72957556/101979213-7fb50080-3c9e-11eb-8489-af11421cc745.png)

## 実装した機能

+ 新規登録/ログイン
+ お客様カード作成機能
+ お客様カード検索機能
+ お客様メモ共有機能
+ お客様ブックマーク記録機能
+ セルフチェック機能
+ 雑談ネタの提供機能


## 実装予定の機能
誕生日の当日にポップアップが表示される機能

## データベース設計

![Re_lations](https://user-images.githubusercontent.com/72957556/101978634-bd635a80-3c99-11eb-94df-b1bd33027541.png)


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
フロントエンド(BootStrap, javascript, jQuery, HTML/SCSS)
バックエンド(Ruby on Rails6.0 )
単体テスト(RSpec, FactoryBot)
結合テスト(System Spec, Capybara)
データベース(Sequel Pro)
開発環境(MacOS, VScode, Git, GitHub)

## 作者
 
[Tatsuhiro Iwasaki](https://iwasatat.com/)
mail to: it.was07@gmail.com
