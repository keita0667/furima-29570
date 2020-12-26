FactoryBot.define do
  factory :item do
    name {Faker::Lorem.sentence}
    info {Faker::Lorem.sentence}
    category_id { 3 }
    sales_status_id { 3 }
    shipping_fee_id { 3 }
    prefecture_id { 3 }
    scheduled_delivery_id { 3 }
    price { 5000 }
    
  end
end
