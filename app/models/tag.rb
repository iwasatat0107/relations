class Tag < ApplicationRecord

  has_many :client_tag_relations
  has_many :clients, through: :client_tag_relations

end
