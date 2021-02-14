# DB 設計

## users table
 
| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false, unique: true |
| e-mail             | string              | null: false, unique: true |
| password           | string              | null: false               |
| name               | string              | null: false               |
| name_kana          | string              | null: false               |
| birthday           | string              | null: false               |
 
### Association

* has_many :items


## items table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| user               | references          | foreign_key: true       |
| image              | string              | null: false             |
| price              | string              | null: false             |
| name               | string              | null: false             |
| condition          | text                | null: false             |
| delivery_fee       | string              | null: false             |
| area               | string              | null: false             |
| shipment_date      | string              | null: false             |

### Association

* belongs_to :user
* has_one : purchasing


## purchasings table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| payment_amount     | string              | null: false             |
| card_number        | string              | null: false             |
| expiration_date    | string              | null: false             |
| security_code      | string              | null: false             |
| address            | references          | foreign_key: true       |

### Association
 
* has_one : address


## addresses table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| postcode           | string              | null: false             |
| prefecture         | string              | null: false             |
| town               | string              | null: false             |
| house_number       | string              | null: false             |
| building_name      | string              | null: false             |
| phone              | string              | null: false             |

### Association

* belongs_to :purchasing

