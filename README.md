# テーブル設計

## users テーブル

| Column        | Type   | Options  |
|---------------|--------|----------|
| nickname      | string | NOT NULL |
| email         | string | NOT NULL unique: true |
| encrypted_password   | string | NOT NULL |
| first_name    | string | NOT NULL |
| last_name     | string | NOT NULL |
| first_name_kana      | string | NOT NULL |
| last_name_kana       | string | NOT NULL |
| birthday      | date   | NOT NULL |

### Association

 - has_many :items
 - has_many :purchase_histories

## items テーブル

| Column        | Type       | Options  |
|---------------|------------|----------|
| item_name     | string     | NOT NULL |
| description   | text       | NOT NULL |
| category_id   | integer    | NOT NULL |
| condition_id  | integer    | NOT NULL |
| ship_fee_id   | integer    | NOT NULL |
| prefecture_id    | integer    | NOT NULL |
| ship_day_id   | integer    | NOT NULL |
| price         | integer    | NOT NULL |

### Association

 - belongs_to :user
 - has_one :purchase_history

## purchase histories テーブル

| Column        | Type       | Options  |
|---------------|------------|----------|
| user       | references | NOT NULL foreign_key: true |
| item       | references | NOT NILL foreign_key: true |

### Association

 - belongs_to :user
 - belongs_to :item
 - has_one :order

## orders テーブル

| Column        | Type       | Options  |
|---------------|------------|----------|
| postal_code   | string     | NOT NULL |
| prefecture_id    | integer    | NOT NULL |
| city          | string     | NOT NULL |
| address       | string     | NOT NULL |
| building      | string     |          |
| number        | string     | NOT NULL |
| purchase_histories | references | NOT NULL foreign_key: true |

### Association

 - belongs_to :order
 