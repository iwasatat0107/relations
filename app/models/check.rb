class Check < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :smile
  belongs_to_active_hash :aizuchi
  belongs_to_active_hash :empathy
  belongs_to_active_hash :reaction
  belongs_to_active_hash :question
  
  belongs_to :user
  belongs_to :client

  validates :title, presence: true, length: { maximum: 10 }

  with_options numericality: { other_than: 0 } do
    validates :smile_id
    validates :aizuchi_id
    validates :empathy_id
    validates :reaction_id
    validates :question_id
  end

end
