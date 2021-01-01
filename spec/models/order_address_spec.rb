require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it '全ての項目が正しく入力されていれば購入できる' do
        expect(@order_address).to be_valid
      end
      it '建物名は空でも購入できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end
    context '商品購入が上手く行かない時' do
      it 'tokenが空だと購入できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空だと購入できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号は"3桁の数字-4桁の数字"でないと購入できない' do
        @order_address.postal_code = '11111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '都道府県が"---"だと購入できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと購入できない' do
        @order_address.addresses = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Addresses can't be blank")
      end
      it '電話番号が空だと購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が英字だと購入できない' do
        @order_address.phone_number = 'abc'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input half-width characters.')
      end
    end
  end
end
