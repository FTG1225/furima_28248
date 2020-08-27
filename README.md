# テーブル設計

## Users テーブル
| column                    | Type   | Options                                |
| ------------------------- | ------ | -------------------------------------- |
| nickname                  | string | null: false                            |
| email_address             | string | null: false, unique: true, index: true |
| password                  | string | null: false                            |
| sur_name                  | string | null: false                            |
| given_name                | string | null: false                            |
| sur_name_kana             | string | null: false                            |
| given_name_kana           | string | null: false                            |
| date_of_birth             | date   | null: false                            |

### Association
- has_many :items
- has_many :item_purchases

## Items テーブル
| column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| images        | text       | null: false                    |
| name          | string     | null: false                    |
| description   | text       | null: false                    |
| category      | integer    | null: false                    |
| status        | integer    | null: false                    |
| shipping_tax  | integer    | null: false                    |
| prefecture    | integer    | null: false                    |
| shipping_date | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :item_purchase
- has_one :address

## address テーブル
| column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| zip_code      | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| item          | references | foreign_key: true              |
### Association
- belongs_to :item

## Item_purchase テーブル
| column | Type       | Options           |
| ------ | ---------- | ----------------- |
| item   | references | foreign_key: true |
| user   | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

