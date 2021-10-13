class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :first_name,
            presence: true,
            format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'must be full-width characters' }
  validates :last_name,
            presence: true,
            format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'must be full-width characters' }
  validates :first_kana,
            presence: true,
            format: { with: /\A[ァ-ヶー－]+\z/, message: 'must be full-width katakana' }
  validates :last_kana,
            presence: true,
            format: { with: /\A[ァ-ヶー－]+\z/, message: 'must be full-width katakana' }
  validates :birthday, presence: true
  validates_format_of :password, { with: /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/, message: 'must be alphanumeric characters' }

  has_many :items
end
