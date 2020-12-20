class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name
      t.text    :info
      t.integer :price
      t.integer :category_id
      t.integer :sales_status_id
      t.integer :shipping_fee_id
      t.integer :prefecture_id
      t.integer :scheduled_delivery_id
      t.integer :user_id
      t.timestamps
    end
  end
end

# # itemsテーブルのREADME
# | name                 | string  | null: false | #商品名
# | info                 | text    | null: false | #商品の説明
# | price                | integer | null: false | #販売価格
# | category_id          | integer | null: false | #カテゴリー
# | sales_status_id      | integer | null: false | #商品の状態
# | shipping_fee_id      | integer | null: false | #配送料の負担
# | prefecture_id        | integer | null: false | #発送元の地域
# | scheduled_delivery_id| integer | null: false | #発送までの日数
# | user_id              | integer | null: false, foreign_key: true | #user_id外部キー参照