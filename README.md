# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## users　＊ユーザー情報

|Column    |Type   |Options  |
|----------|-------|---------|
|nickname  |string |NOT NULL,unique:true |
|email     |string |NOT NULL,unique:true |
|encrypted_password|string |NOT NULL |
|birthday  |data   |NOT NULL |
|last_name |string|NOT NULL|
|first_name|string|NOT NULL|
|read_name |string|NOT NULL|


### Association
has_many :products
has_many :purchase_record ＊購入者情報テーブル

## products　＊商品情報

|Column    |Type       |Options  |
|----------|-----------|---------|
|user      |references |foreign_key: true|
image (ActiveStorageで実装)
|product_name|text     |NOT NULL |
|product_description|text|NOT NULL|
|category_id  |integer|NOT NULL |
|product_condition_id|integer|NOT NULL|
|delivery_charge_id|integer|NOT NULL|
|shipping_area_id|integer|NOT NULL|
|delivery_day_id|integer|NOT NULL|
|price|integer|NOT NULL|

### Association
belongs_to :user
has_one :purchase_record 

## shipping_addresses　*配送先住所

|Column    |Type       |Options  |
|----------|-----------|---------|
|postal_code|integer   |NOT NULL |
|prefectures_id|string    |NOT NULL |
|municipality|string|NOT NULL|
|address|string|NOT NULL|
|building_name|string| |
|phone_number|integer|NOT NULL|
|purchase_record|references|foreign_key: true|


### Association
has_one :products
has_one :purchase_record 

## purchase_records ＊購入者情報
|Column    |Type       |Options  |
|----------|-----------|---------|
|product   |references |foreign_key: true|
|user      |references |foreign_key: true|

has_many :user
has_one :product
has_one :shipping_address
