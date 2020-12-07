class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :clients, dependent: :destroy
  has_many :memos, dependent: :destroy
  has_many :checks, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, presence: true

  def already_favorited?(client)
    self.favorites.exists?(client_id: client.id)
  end

end
