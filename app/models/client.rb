class Client < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  belongs_to :user
  has_many :memos, dependent: :destroy
  has_many :checks, dependent: :destroy
  has_one_attached :image
  has_many :favorites, dependent: :destroy
  
  with_options format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
    validates :last_name, presence: true, length: { maximum: 10 }
    validates :first_name, length: { maximum: 10 } ,allow_blank: true
  end
  with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :last_name_kana, length: { maximum: 10 }
    validates :first_name_kana, length: { maximum: 10 } ,allow_blank: true
  end

  validates :company, length: { maximum: 20 }

  def self.search(search)
    if search != ""
      Client.where('last_name LIKE(?) OR first_name LIKE(?) OR last_name_kana LIKE(?) OR first_name_kana LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      Client.all.order("created_at DESC")
    end
  end
end
