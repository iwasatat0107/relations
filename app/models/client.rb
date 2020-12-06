class Client < ApplicationRecord
  
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/} do
    validates :last_name, presence: true
    validates :first_name, presence: true
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/} do
    validates :last_name_kana, presence: true
    validates :first_name_kana, presence: true
  end

  belongs_to :user
  has_many :memos, dependent: :destroy
  has_many :checks, dependent: :destroy
  has_one_attached :image
  has_many :favorites, dependent: :destroy
  has_many :client_tag_relations
  has_many :tags, through: :client_tag_relations

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  def self.search(search)
    if search != ""
      Client.where('last_name_kana LIKE(?) OR first_name_kana LIKE(?)', "%#{search}%", "%#{search}%")
    else
      Client.all.order("created_at DESC")
    end
  end
end
