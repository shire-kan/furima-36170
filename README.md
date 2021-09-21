# テーブル設計

## users テーブル

| Column               | Type            | Options                              |
| -------------------- | --------------- | ------------------------------------ |
| nickname             | string          | null: false                          |
| email                | string          | null: false, unique: true            |
| encrypted_password   | string          | null: false                          |
| first_name           | string          | null: false                          |
| last_name            | string          | null: false                          |
| first_kana           | string          | null: false                          |
| last_kana            | string          | null: false                          |
| birthday             | date            | null: false                          |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column               | Type            | Option                               |
| -------------------- | --------------- | ------------------------------------ |
| title                | string          | null: false                          |
| content              | text            | null: false                          |
| price                | integer         | null: false                          |
| user                 | references      | null: false, foreign_key: true       |
| condition_id         | integer         | null: false                          |
| method_id            | integer         | null: false                          |
| prefecture_id        | integer         | null: false                          |
| deliverydays_id      | integer         | null: false                          |
| category_id          | integer         | null: false                          |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column               | Type            | Option                               |
| -------------------- | --------------- | ------------------------------------ |
| user                 | references      | null: false, foreign_key: true       |
| item                 | references      | null: false, foreign_key: true       |

### Association

- belongs_to :user
- belongs_to :item
- has_one :ship

## ships テーブル

| Column               | Type            | Option                               |
| -------------------- | --------------- | ------------------------------------ |
| postal_code          | string          | null: false                          |
| prefecture_id        | integer         | null: false                          |
| municipality         | string          | null: false                          |
| address              | string          | null: false                          |
| building             | string          |                                      |
| phone_number         | string          | null: false                          |
| purchase             | references      | null: false, foreign_key: true       |

### Association

- belongs_to :purchase