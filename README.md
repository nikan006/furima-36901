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
| birth_yeah          | string     | null: false |
| birth_month         | string     | null: false |
| birth_day           | string     | null: false |

### Association
- has_many : items

## items テーブル
| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| image       | references | null: false |
| name        | string     | null: false |
| text        | text       | null: false |
| category    | references | null: false |
| condition   | references | null: false |
| price       | integer    | null: false |

### Association
- belongs_to : users
- belongs_to : orders
- belongs_to : delivery

## orders テーブル
| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| postal      | integer    | null: false |
| prefecture  | string     | null: false |
| city        | string     | null: false |
| adress1     | string     | null: false |
| adress2     | string     |             |
| telephone   | string     | null: false |

### Association
- has_many   : items
- belongs_to : delivery

## delivery テーブル
| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| fee         | references | null: false |
| prefecture  | string     | null: false |
| day         | integer    | null: false |

### Association
- has_many   : items
- belongs_to : orders

