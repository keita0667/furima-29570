class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :postal_code           , null: false
      t.string  :city                  , null: false
      t.string  :addresses             , null: false
      t.string  :building_name         
      t.integer :phone_number          , null: false, limit: 8
      t.integer :prefecture_id         , null: false
      t.references :order             
      t.timestamps
    end
  end
end
