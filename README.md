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




<!-- usersテーブル -->

* usersテーブル
| Column          | Type               | Options     |
| ------          | -------            | ------------| 
| email           | string             | null: false, unique: true | #email
| password        | encrypted_password | null: false | #password
| nickname        | string             | null: false | #nickname
| birth_date      | date               | null: false | #生年月日
| last_name       | string             | null: false | #苗字
| first_name      | string             | null: false | #名前
| last_name_kana  | string             | null: false | #苗字(カナ)
| first_name_kana | string             | null: false | #名前(カナ)

* * Association
- has_many : item
- has_many : purchase

<!-- itemsテーブル -->

* itemsテーブル(商品テーブル)
| Column            | Type    | Options     |
| ------            | ------- | ------------|
| image             | string  | null: false | #出品画像
| name              | string  | null: false | #商品名
| info              | text    | null: false | #商品の説明
| price             | string  | null: false | #販売価格
| category          | string  | null: false | #カテゴリー
| sales_status      | string  | null: false | #商品の状態
| shipping_fee      | string  | null: false | #配送料の負担
| prefecture        | string  | null: false | #発送元の地域
| scheduled_delivery| string  | null: false | #発送までの日数
| user_id           | integer | null: false, foreign_key: true | #user_id外部キー参照


* * Association
- belongs_to : user
- has_many : purchase
- has_one : purchase

<!-- purchasesテーブル -->

* purchasesテーブル(購入テーブル)
| Column          | Type    | Options      |
| ------          | ------- | ------------ |
| user_id         | integer | null: false, foreign_key: true  | #user_id外部キー参照
| item_id         | integer | null: false, foreign_key: true  | #item_id外部キー参照
# addressesテーブルの都道府県カラムのActiveHash
| prefecture_id   | integer | null: false  | 

* * Association
- belongs_to : user, item
- has_one : address


<!-- addressesテーブル -->

* addressesテーブル
| Column          | Type    | Options     |
| ------          | ------- | ------------|
| prefecture_id   | integer | null: false | #都道府県
| city            | string  | null: false | #市区町村
| address         | string  | null: false | #番地
| building_name   | string  |             | #建物名
| postal_code     | string  | null: false | #郵便番号
| phone_number    | string  | null: false | #電話番号


* * Association
- belongs_to : purchase