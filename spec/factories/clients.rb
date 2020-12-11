FactoryBot.define do
  factory :client do
    last_name                  { '阿部' }
    first_name                 { '太郎' }
    last_name_kana             { 'アベ' }
    first_name_kana            { 'タロウ' }
    company                    { 'テスト会社' }
    prefecture_id              { 1 }
    birthday                   { '1980-01-01' }

    association :user

    after(:build) do |client|
      client.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
