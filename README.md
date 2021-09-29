# README
# users テーブル
| Column              | Type       | Options     |
| ------------------- | ---------- | ------------|
| nickname            | string     | null: false |
| email               | string     | null: false |
| encrypted_password  | string     | null: false |
| family_name         | string     | null: false |
| first_name          | string     | null: false |
| family_name_kana    | string     | null: false |
| first_name_kana     | string     | null: false |
| birth_date          | date       | null: false |


### Association
- has_many : items
- has_many : orders

## items テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| text          | text       | null: false                    |
| category_id   | references | null: false                    |
| condition_id  | references | null: false                    |
| fee_id        | references | null: false                    |
| prefecture_id | references | null: false                    |
| day_id        | references | null: false                    |
| price         | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association
- belongs_to : users
- has_one    : orders

## orders テーブル
| Column      | Type       | Options                       |
| ----------- | ---------- | ----------------------------- |
| item_id     | references | null: false, foreign_key: true|
| user_id     | references | null: false, foreign_key: true|


### Association
- belongs_to : items
- belongs_to : users
- has_one    : delivery

## delivery テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| zip_code      | integer    | null: false                    |
| prefecture_id | references | null: false                    |
| city          | string     | null: false                    |
| adress1       | string     | null: false                    |
| adress2       | string     |                                |
| telephone     | string     | null: false                    |
| order_id      | references | null: false, foreign_key: true |

### Association
- has_many : orders

