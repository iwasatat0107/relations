class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  
  has_many :clients, dependent: :destroy
  has_many :memos, dependent: :destroy
  has_many :checks, dependent: :destroy
end
