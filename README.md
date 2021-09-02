# テーブル設計

## users テーブル

| Column        | Type   | Options  |
|---------------|--------|----------|
| nickname      | string | NOT NULL |
| email         | string | NOT NULL |
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
| category      | integer    | NOT NULL |
| condition     | integer    | NOT NULL |
| ship_fee      | integer    | NOT NULL |
| prefecture_id    | integer    | NOT NULL |
| ship_day      | integer    | NOT NULL |
| price         | integer    | NOT NULL |

### Association

 - belongs_to :user
 - has_many :purchase_histories

## purchase history テーブル

| Column        | Type       | Options  |
|---------------|------------|----------|
| user_id       | references | NOT NULL foreign_key: true |
| item_id       | references | NOT NILL foreign_key: true |

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

### Association

 - belongs_to :order
 