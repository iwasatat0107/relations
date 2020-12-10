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
    validates :first_name, allow_blank: true, length: { maximum: 10 }
  end
  with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :last_name_kana, presence: true, length: { maximum: 10 }
    validates :first_name_kana, allow_blank: true, length: { maximum: 10 }
  end

  validates :company, length: { maximum: 15 }

  def self.search(search)
    if search != ''
      Client.where('last_name LIKE(?) OR first_name LIKE(?) OR last_name_kana LIKE(?) OR first_name_kana LIKE(?)',
                   "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      Client.all.order('created_at DESC')
    end
  end
end
