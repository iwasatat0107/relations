class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :client
  
  validates_uniqueness_of :client_id, scope: :user_id
end
