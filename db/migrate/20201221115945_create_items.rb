class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name    , null: false
      t.text    :info    , null: false
      t.integer :price   , null: false
      t.integer :category_id           , null: false
      t.integer :sales_status_id       , null: false
      t.integer :shipping_fee_id       , null: false
      t.integer :prefecture_id         , null: false
      t.integer :scheduled_delivery_id , null: false
      t.references :user , foreign_key: true
      t.timestamps
    end
  end
end


# * itemsテーブル(商品テーブル)
# | Column               | Type    | Options     |
# | ------               | ------- | ------------|
# | name                 | string  | null: false | #商品名
# | info                 | text    | null: false | #商品の説明
# | price                | integer | null: false | #販売価格
# | category_id          | integer | null: false | #カテゴリー
# | sales_status_id      | integer | null: false | #商品の状態
# | shipping_fee_id      | integer | null: false | #配送料の負担
# | prefecture_id        | integer | null: false | #発送元の地域
# | scheduled_delivery_id| integer | null: false | #発送までの日数
# | user_id              | integer | null: false, foreign_key: true | #user_id外部キー参照
