# Re:lations
![relations_logo](https://user-images.githubusercontent.com/72957556/101978379-cf43fe00-3c97-11eb-8167-071b16428f7a.png)
 
## お客様カード 記録アプリ
**リレーションズは、「対人関係で、幸せに気がつく」現代のビジネスカードです。**

## URL
http://54.199.236.29/ <br>
 
かんたんログインボタンをご用意しております。<br>
**ゲストmail：guest@example.com**<br>
**ゲストPASS：SecureRandom.urlsafe_base64**<br>

![relations_rm_top](https://user-images.githubusercontent.com/72957556/101979299-47fa8880-3c9f-11eb-9aeb-cb7e5eee76b6.png)

## About
**お客様の情報を社内で共有・振り返り**
 - **お客様の情報をカードに記録することができます。**
 - **お客様カードは社員同士で情報の共有、更新、ブックマークができます。**
 - **社員は自分の対応を振り返ることで、傾聴力の向上を目指します。**
 
 ## Issue
**オンラインによる対人関係の変化**
 - **課題の背景は、ビジネスパーソンのリモート業務が増加傾向にあることです。**
 - **リモートでの面会では、名刺交換の機会はありません。**
 - **突発的な雑談の機会が減り、コミュニケーションも変化しています。**
 
 ## Why
**人の全ての悩みは対人関係**
 - **アドラー心理学では、「人間の悩みは、全て対人関係の悩みである」といわれています。**
 - **対人関係を正しく構築できれば、この世界は、幸せで満ちていることに気がつくでしょう。**
 
 ![relations_rm_index](https://user-images.githubusercontent.com/72957556/101979216-8774a500-3c9e-11eb-869c-ea09e90f7d47.png)
 
# サービスを作った理由
私が前職で体験した課題と、時代背景にニーズがあるのではないかと考えました。
そして、以下のようなサービスがあればと感じていました。
- **「お客様の顔、名前、情報が社員同士で共有できる。」**
- **「社員が自分自身を振り返る機会をつくる」**
- **「オンラインビジネスで対人関係も変化している」**
過去の自分の課題を解決できるのではないかと考え、事前に構想を練りに練って、本サービスを制作しました。
 
## ペルソナ
**30代男性**<br>
営業職
趣味はゴルフ・ランニング・お酒
妻・娘2人
リモートワークが増加

## 目指した課題解決
**オンラインビジネスの対人関係の構築**<br>
相手の顔と名前がおぼえられない。
前回話して盛り上がった内容が思い出せない。
直前まで話そうと考えていた、些細な話題を忘れてしまう。
初対面だと、雑談のネタや話題が思いつかない。

## 課題の背景
**リモート対面のビジネスが増えたこと**<br>
オンライン上では突発的な雑談やコミュニケーションが生まれにくい。
2〜3回の対話だと何を話していいか分からなくなり、沈黙や気まずい空気になる。

## 洗い出した要件
**名刺交換やコミュニケーションの機会が減ったこと**<br>
相手の顔と名前、漢字の正しい読み方が分からなくて失礼な対応になりかねない場合がある。
多くの取引先がいると、各相手との共通の話題を思い出せなくなくなる。
現実のコミュニケーションだと、共通の話題も見つかりやすい。
天気、経路、近くの美味しいお店、身につけてる物、相手の仕草...etc

![relations_nm_new](https://user-images.githubusercontent.com/72957556/101979213-7fb50080-3c9e-11eb-8489-af11421cc745.png)


# メッセージ
## 誰の何の課題を解決するか
繰り返しになりますが、自分の課題と、時代背景からこのアプリケーションは生まれました。
一つ一つの機能自体はいたってシンプルなものばかりです。機能面の多さにもあまり自信はありません。
フロントの華やかさや見栄えも正直ないと思います。もちろん、実際に自分が使ってみると、まだまだ改善の余地ばかりでした。<br>

しかしながら、何よりも「課題解決する手段」という軸を意識した制作を心掛けました。
ただ単に作る目的で作ったわけではなく、実際に運用することも想定し、他の方のフィードバックや意見も取り入れました。
素人なりに、何よりもまずはユーザーの目線に立ち、課題を解決する上で必要なもの手段は何かを考え、必死に手を動かしました。
また、GitHubを活用し、「issueを確認 -> branchを切る -> 開発を行う -> pushする -> pull requestを送信する -> mergeする」といったチーム開発の流れを疑似的に再現するなど、より実践的な環境で作業を進めました。<br>
もしご興味がありましたら、実際に触ってご意見をいただけると幸いです。

## 意識した点
**N+1問題**<br>
結論、includesメソッドを使用し、不要なSQL文を発行しないようにして、JOINで一括に取得するようにしました。
その結果、今までは読み込みに読み込み時間を1秒以上、短縮することができました。
Railsは普段SQLを意識しなくて済み、関連テーブルのデータも取ってきてくれるフレームワークなので起きがちな問題だと思います。
N+1問題を検知するgemで「bullet」がありますが、ログを見ていれば気付けると思ったのであえて入れませんでした。

## 頑張った点
**テストコードを約1,000行近く書いたこと**<br>
テストコードは同期の中で、1番多く書いた自信があります。
単体テストでは、モデルとコントローラーの機能ごとに問題がないか確かめました。
全てのモデルに単体テストを書き、バリデーションの挙動を確認しました。
結合テストでは、ユーザーがブラウザで操作する一連の流れを再現して、問題がないか確かめました。
例えば、「画像URLとテキストを作成してボタンを押して、TOPページに戻ると作成した内容が一覧表示されている」という流れを一気に確かめました。
黒いターミナルが、オールグリーンでテストに成功できたときは爽快でした。

## 苦労した点
**AWSへ手動デプロイ**<br>
最初はHerokuへデプロイしたのですが、サイトが立ち上がるのに通信速度が出なかったので改めてAWSで構築しました。
工数の多さに驚き、一瞬怯みましたが、悪戦苦闘しながらデプロイしました。
途中で、新しい技術や概念理解に苦労しました。例えば、Unicornを理解するために必要な「プロセス」の概念です。
詰まるたびに公式ドキュメント、Qiitaなどで情報を収集していきました。
その後、デプロイ作業をポピュラーな自動デプロイツール、Capistranoを導入しました。

## 今後の課題点
**レスポンス速度の改善**<br>
ユーザーからすると、画面遷移のまだ待ち時間が長く感じられると思います。
今は、ミリ秒単位でのレスポンスが求められるので、予め意識しておく必要があると痛感しました。
今後は、非同期通信でリクエスト後に、ブラウザの一部分のみが更新されるようにして改善したいです。

## 機能一覧

+ 新規登録/ログイン/
+ お客様カード作成機能
+ お客様カード検索機能
+ お客様メモ記録機能
+ お客様ブックマーク機能
+ セルフチェック機能
+ 雑談ネタの提供機能

## 実装予定の機能
+ 誕生日の当日にポップアップが表示される機能

## インフラ構成図
<img width="670" alt="aws" src="https://user-images.githubusercontent.com/72957556/102193212-25ff4100-3eff-11eb-8573-854baa32751a.png">

#使用技術・環境
### 【フロントエンド】
・HTML<br>
・CSS<br>
・JavaScript<br>
.Bootstrap<br>
### 【バックエンド】
・Ruby 2.6.5<br>
・Ruby on Rails 6.0.3.4<br>
### 【データベース】
・MySQL5.6.47<br>
### 【本番環境】
・AWS(S3/EC2)<br>
・Nginx、Unicorn<br>
### 【その他使用技術】
・Git,GitHub<br>
・RSpec<br>
・Rubocop<br>
・Capistrano<br>

## データベース設計
![relations_er2](https://user-images.githubusercontent.com/72957556/102198700-09b2d280-3f06-11eb-9739-37cf0d4682ca.png)


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
| first_name         | string     |                               |
| last_name_kana     | string     | null: false                   |
| first_name_kana    | string     |                               |
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
| smile_id          | integer     | null: false,                   |
| aizuchi_id        | integer     | null: false,                   |
| empathy_id        | integer     | null: false,                   |
| reaction_id       | integer     | null: false,                   |
| question_id       | integer     | null: false,                   |

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


## 作者
 **最後まで見ていただきたき、ありがとうございます！**<br>
 新しいことにや、自分の限界にチャレンジすることが好きです。
400kmの徒歩旅行、住み込みバイトで日本を旅したことがあります。
プログラミング以外にも社会人からピアノ、ダーツ、バスケット、ランニング、フットサル、水泳などにも挑戦してきました。<br>
 
[Tatsuhiro Iwasaki](https://iwasatat.com/)
mail to: it.was07@gmail.com
