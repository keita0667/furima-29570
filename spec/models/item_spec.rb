require 'rails_helper'

RSpec.describe Item, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it '商品画像と商品名と商品の説明が存在すれば出品できる' do
        expect(@item).to be_valid
      end
      it 'カテゴリーが"---"以外であれば出品できる' do
        @item.category_id = "2"
        expect(@item).to be_valid
      end
      it '商品の状態が"---"以外であれば出品できる' do
        @item.sales_status_id = "2"
        expect(@item).to be_valid
      end
      it '配送料の負担が"---"以外であれば出品できる' do
        @item.shipping_fee_id = "2"
        expect(@item).to be_valid
      end
      it '発送元の地域が"---"以外であれば出品できる' do
        @item.prefecture_id = "2"
        expect(@item).to be_valid
      end
      it '発送までの日数が"---"以外であれば出品できる' do
        @item.scheduled_delivery_id = "2"
        expect(@item).to be_valid
      end
      it '販売価格が300円以上、9,999,999円以下であれば出品できる' do
        @item.price = "1000"
        expect(@item).to be_valid
      end

    end
    context '商品出品ができないとき' do
      it '出品画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では出品できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空では出品できない' do
        @item.info = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'カテゴリーが"---"では出品できない' do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it '商品の状態が"---"では出品できない' do
        @item.sales_status_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status Select")
      end
      it '配送料の負担が"---"では出品できない' do
        @item.shipping_fee_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status Select")
      end
      it '発送元の地域が"---"では出品できない' do
        @item.prefecture_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture Select")
      end
      it '発送までの日数が"---"では出品できない' do
        @item.scheduled_delivery_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery Select")
      end
      it '価格が空では出品できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が300円以下では出品できない' do
        @item.price = "200"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it '価格が9,999,999円以上では出品できない' do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
    end
  end
end
