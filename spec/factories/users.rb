FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation {}
    first_name       { Gimei.kanji }
    last_name        { Gimei.kanji }
    first_name_kana        { Gimei.katakana }
    last_name_kana         { Gimei.katakana }
    birth_date             { '1937-03-04' }
  end
end
