FactoryBot.define do
  factory :order_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '111-1111' }
    prefecture_id { 3 }
    city { '葛飾区' }
    addresses { '1-1-1' }
    building_name { 'タワー' }
    phone_number { 123_456_789 }
  end
end
