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


*usersテーブル
| Column          | Type   | Options     |
| ------          | -------| ------------|
| email           | string             | null: false |
| password        | encrypted_password | null: false |
| nickname        | string | null: false |
| birth_date      | date | null: false |
| last name       | string | null: false |
| first name      | string | null: false |
| last name kana  | string | null: false |
| first name kana | string | null: false |

**Association
- has_many : listing


*Purchasesテーブル(購入テーブル)
| Column          | Type   | Options     |
| ------          | -------| ------------|
| user_id           | string | null: false |
| item_id     | string | null: false |

**Association
- belongs_to : listing


*Listingテーブル(出品テーブル)
| Column          | Type   | Options     |
| ------          | -------| ------------|
| image           | string | null: false |
| name            | string | null: false |
| info            | string | null: false |
| price           | string | null: false |
| category        | string | null: false |
| sales status    | string | null: false |

**Association
- belongs_to : user
- has_many : purchase


*Addressesテーブル
| Column          | Type   | Options     |
| ------          | -------| ------------|
| prefecture      | string | null: false |
| city            | string | null: false |
| address         | string | null: false |
| building_name   | string | null: false |
| postal code     | string | null: false |
| phone number    | string | null: false |

都道府県カラムもactivehashで実装するため、activehashが使えるようなカラム名と型にしましょう。
カード以外の商品購入時に入力する情報（郵便番号や電話番号、建物名など）を保存するカラムを全て用意しましょう。

**Association
- belongs_to : purchase