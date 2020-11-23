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
| title             | string     | null: false                     |
| text              | text       |                                 | 
| user_id           | references | null: false, foreign_key:true   |
| client_id         | references | null: false, foreign_key:true   |


### Association

- belongs_to :user
- has_one :client
