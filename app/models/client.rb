class Client < ApplicationRecord
  with_options presence: true do
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
  end

  belongs_to :user
end
