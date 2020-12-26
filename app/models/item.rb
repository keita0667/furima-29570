class Item < ApplicationRecord


  # validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'Out of setting range'}
  

  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :price
  end
    validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width-number' }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'Out of setting range'}

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id 
    validates :scheduled_delivery_id
  end
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :sales_status
  belongs_to :scheduled_delivery
  belongs_to :shipping_fee_status
  has_one_attached :image

# 画像は1枚必須であること(ActiveStorageを使用すること)
# - 商品名が必須であること
# - 商品の説明が必須であること
# - カテゴリーの情報が必須であること
# - 商品の状態についての情報が必須であること
# - 配送料の負担についての情報が必須であること
# - 発送元の地域についての情報が必須であること
# - 発送までの日数についての情報が必須であること
# - 価格についての情報が必須であること
# - 価格の範囲が、¥300~¥9,999,999の間であること
# - 販売価格は半角数字のみ保存可能であること

# Price Half-width number
# Price Out of setting range
# Category Select
# Sales status Select
# Shipping fee status Select
# Prefecture Select
# Scheduled delivery Select
end
