# README
# users テーブル
| Column              | Type       | Options                   |
| ------------------- | ---------- | --------------------------|
| nickname            | string     | null: false               |
| email               | string     | null: false, unique: true |
| encrypted_password  | string     | null: false               |
| family_name         | string     | null: false               |
| first_name          | string     | null: false               |
| family_name_kana    | string     | null: false               |
| first_name_kana     | string     | null: false               |
| birth_date          | date       | null: false               |


### Association
- has_many : items
- has_many : orders

## items テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| text          | text       | null: false                    |
| category_id   | integer    | null: false                    |
| condition_id  | integer    | null: false                    |
| fee_id        | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| day_id        | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to : user
- has_one    : order

## orders テーブル
| Column      | Type       | Options                       |
| ----------- | ---------- | ----------------------------- |
| item        | references | null: false, foreign_key: true|
| user        | references | null: false, foreign_key: true|


### Association
- belongs_to : item
- belongs_to : user
- belongs_to : delivery

## deliverys テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| zip_code      | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| adress1       | string     | null: false                    |
| adress2       | string     |                                |
| telephone     | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association
- has_one : order

