class User < ApplicationRecord
  has_many :item
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A[ぁ-んァ-ン一-龥]/
  VALID_PASSWORD_SURNAME = /\A[ァ-ヶー－]+\z/

  validates :nickname, presence: true
  validates :password, format: {with:/(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/}
  validates :family_name, presence: true, format: {with:VALID_PASSWORD_REGEX}
  validates :first_name, presence: true, format: {with:VALID_PASSWORD_REGEX}
  validates :family_name_kana, presence: true, format: {with:VALID_PASSWORD_SURNAME}
  validates :first_name_kana, presence: true, format: {with:VALID_PASSWORD_SURNAME}
  validates :birth_date, presence: true
end
