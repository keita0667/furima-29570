class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render "new"
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :name, :info, :price, :category_id, :sales_status_id,
      :shipping_fee_id, :prefecture_id, :scheduled_delivery_id, :user_id,
      :image
    )
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