class Memo < ApplicationRecord
  belongs_to :user
  belongs_to :client

  validates :text, presence: true
end
