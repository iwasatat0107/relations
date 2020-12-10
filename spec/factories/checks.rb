FactoryBot.define do
  factory :check do
    title                 { 'テストチェック' }
    smile_id              { 1 }
    aizuchi_id            { 1 }
    empathy_id            { 1 }
    reaction_id           { 1 }
    question_id           { 1 }
    association :user
    association :client
  end
end
