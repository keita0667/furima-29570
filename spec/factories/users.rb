FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {}
    firstname_kanji       {Gimei.kanji}
    lastname_kanji        {Gimei.kanji}
    firstname_kana        {Gimei.katakana}
    lastname_kana         {Gimei.katakana}
    
  end
end