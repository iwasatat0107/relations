class Check < ApplicationRecord

  belongs_to :user
  belongs_to :client

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :smile
  belongs_to_active_hash :aizuchi
  belongs_to_active_hash :empathy
  belongs_to_active_hash :reaction
  belongs_to_active_hash :question

  validates :title, presence: true
end
