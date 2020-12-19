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

**Association
- belongs_to : 
- has_many : 

*usersテーブル
| Column          | Type   | Options     |
| ------          | -------| ------------|
| email           | string | null: false |
| password        | string | null: false |
| nickname        | string | null: false |
| birth date      | string | null: false |
| last name       | string | null: false |
| first name      | string | null: false |
| last name kana  | string | null: false |
| first name kana | string | null: false |

**Association
- belongs_to : addresses
- has_many : listings


*Purchasesテーブル(購入テーブル)
| Column          | Type   | Options     |
| ------          | -------| ------------|
| token           | string | null: false |
| postal code     | string | null: false |
| phone number    | string | null: false |

**Association
- belongs_to : listings


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
- belongs_to : users
- has_many : listings


*Addressesテーブル
| Column          | Type   | Options     |
| ------          | -------| ------------|
| prefecture      | string | null: false |
| city            | string | null: false |
| address         | string | null: false |

**Association
- belongs_to : users