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

## USERS TABLE　＊ユーザー情報

|Column    |Type   |Options  |
|----------|-------|---------|
|nickname  |string |NOT NULL,unique:true |
|email     |string |NOT NULL,unique:true |
|password  |string |NOT NULL |
|birthday  |integer|NOT NULL |


### Association
has_many :products
has_one :shipping_address *配送先住所
has_one :purchase record ＊購入者情報テーブル

## Products TABLE　＊商品情報

|Column    |Type       |Options  |
|----------|-----------|---------|
|user      |references |
image (ActiveStorageで実装)
|product_name|text     |NOT NULL |
|category  |string     |NOT NULL |
|product condition|string|NOT NULL|
|Delivery charge|string|NOT NULL|
|Delivery day|integer|NOT NULL|
|price|integer|NOT NULL|

### Association
belongs_to :users
has_one :shipping_address 
has_one :purchase record Table

## Shipping address Table　*配送先住所

|Column    |Type       |Options  |
|----------|-----------|---------|
|Postal code|integer   |NOT NULL |
|Prefectures_都道府県|string    |NOT NULL |
|Municipality_市町村|string|NOT NULL|
|Address_番地|string|NOT NULL|
|Building name_建物名|string| |
|Phone number|integer|NOT NULL|
|purchase|references| |
|user|references| |

### Association
has_one :users
has_one :products
has_one :purchase_record 

## Purchase Record TABLE　＊購入者情報
|Column    |Type       |Options  |
|----------|-----------|---------|
|product   |references | |
|user      |references | |

has_one :users
has_one :products
has_one :shipping address
