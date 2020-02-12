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


## Productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text||
|price|integer|null: false|
|condition_id|integer|null :false|
|delivery_charge_id|integer|null: false|
|delivery_prefecture_id|integer|null: false|
|delivery_days_id|integer|null: false|
|delivery_method_id|integer|null: false|
|status_id|integer|null: false|
|transaction_id|integer|null: false|
|category_id|integer|null: false|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :transaction
- belongs_to :category

## Categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many: products

## Transactionテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false|
|buyer_id|references|null: false, foreign_key: {to_table: :users}|
### Association
- belongs_to :product
- belongs_to :buyer, class_name: 'User'

## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birthday_yyyy|integer|null: false|
|birthday_mm|integer|null: false|
|birthday_dd|integer|null: false|
|content|text||
|address|integer|null: false|
|card|integer|null: false|
### Association
- has_many :products
- has_many :transactions
- has_one :card
- has_one :address

## Cardテーブル
|card_number|integer|null: false|
|card_exp_yy|integer|null: false|
|card_exp_mm|integer|null: false|
|card_csv|integer|null: false|
|user_id|integer|null: false|
### Association
- belongs_to :user

## Addressテーブル
|post_num|integer|null: false|
|prefecture|string|null: false|
|municipality|string|null: false|
|address|string|null: false|
|phone_num|string|null: false|
|user_id|integer|null: false|
### Association
- belongs_to :user