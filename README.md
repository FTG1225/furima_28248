# テーブル設計

## Users テーブル
| column          | Type   | Options                                |
| --------------- | ------ | -------------------------------------- |
| nickname        | string | null: false                            |
| email address   | string | null: false, unique: true, index: true |
| password        | string | null: false                            |
| sur name        | string | null: false                            |
| given name kana | string | null: false                            |
| dob             | string | null: false                            |

### Association
- belongs_to :user


## Item テーブル
| column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| images              | text       | null: false                    |
| product name        | string     | null: false                    |
| product description | text       | null: false                    |
| product category    | integer    | null: false                    |
| product status      | integer    | null: false                    |
| shipping tax        | integer    | null: false                    |
| prefecture          | integer    | null: false                    |
| shipping date       | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association
- belongs_to :address
- has_one :item_purchase

## Item_purchase テーブル
| column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| zip code      | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| house number  | string     | null: false                    |
| building name | string     | null: false                    |
| phone number  | string     | null: false                    |
| purchase user | references | null: false, foreign_key: true |
| seller user   | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item