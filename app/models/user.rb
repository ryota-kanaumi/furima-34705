class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :nickname, presence: true
         validates :birthday, presence: true
         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])[a-z\d]{6,32}+\z/
         validates :password, presence: true, length: { minimum: 6, maximum: 32}, format: { with: VALID_PASSWORD_REGEX}
         VALID_LAST_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
         validates :last_name, presence: true, format: { with: VALID_LAST_NAME_REGEX}
         VALID_FIRST_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
         validates :first_name, presence: true, format: { with: VALID_FIRST_NAME_REGEX}
         VALID_LAST_READ_NAME_REGEX = /\A[ァ-ヶー－]+\z/
         validates :last_read_name, presence: true, format: { with: VALID_LAST_READ_NAME_REGEX}
         VALID_FIRST_READ_NAME_REGEX = /\A[ァ-ヶー－]+\z/
         validates :first_read_name, presence: true, format: { with: VALID_FIRST_READ_NAME_REGEX}
end
