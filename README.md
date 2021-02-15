# DB 設計

## users table
 
| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false, unique: true |
| e-mail             | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| last_name          | string              | null: false               |
| first_name         | string              | null: false               |
| kana_lastname      | string              | null: false               |
| kana_firstname     | string              | null: false               |
| birthday           | date                | null: false               |
 
### Association

* has_many :items


## items table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| user               | references          | foreign_key: true       |
| price              | integer             | null: false             |
| name               | string              | null: false             |
| condition          | text                | null: false             |
| delivery_fee       | integer             | null: false             |
| area_id            | integer             | null: false             |
| shipment_date      | string              | null: false             |

### Association

* belongs_to :user
* has_one : purchasing


## purchasings table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| payment_amount     | integer             | null: false             |
| address            | references          | foreign_key: true       |

### Association
 
* has_one : address


## addresses table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| postcode           | string              | null: false             |
| prefecture_id      | integer             | null: false             |
| town               | string              | null: false             |
| house_number       | string              | null: false             |
| building_name      | string              | null: false             |
| phone              | integer             | null: false             |

### Association

* belongs_to :purchasing

