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
* has_many :purchasings


## items table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| user               | references          | foreign_key: true       |
| price              | integer             | null: false             |
| name               | string              | null: false             |
| explanation        | text                | null: false             |
| category_id        | integer             | null: false             |
| condition_id       | integer             | null: false             |
| delivery_fee_id    | integer             | null: false             |
| area_id            | integer             | null: false             |
| shipment_date_id   | integer             | null: false             |

### Association

* belongs_to :users
* has_one : purchasing


## purchasings table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| purchasing         | references          | foreign_key: true       |

### Association
 
* belongs_to :user
* belongs_to :purchasing
* has_one : address


## addresses table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| postcode           | string              | null: false             |
| prefecture_id      | integer             | null: false             |
| town               | string              | null: false             |
| house_number       | string              | null: false             |
| building_name      | string              | null: false             |
| phone              | string              | null: false             |

### Association

* belongs_to :purchasing

