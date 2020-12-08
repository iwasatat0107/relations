FactoryBot.define do
  factory :client do
    last_name                  {"阿部"}
    first_name                 {"太郎"}
    last_name_kana             {"アベ"}
    first_name_kana            {"タロウ"}
    company                    {"テスト会社"}
    prefecture_id              { 1 }
    birthday                   { '1980-01-01' }
    image                      {Faker::Lorem.sentence}
    association :user 
  end
end
