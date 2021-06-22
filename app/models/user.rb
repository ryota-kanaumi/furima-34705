class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :products

         with_options presence: true do
          validates :nickname
          validates :birthday
          validates :password
          validates :last_name
          validates :first_name
          validates :last_read_name
          validates :first_read_name
        end

          VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])[a-z\d]{6,32}+\z/
          validates :password, length: { minimum: 6, maximum: 32}, format: { with: VALID_PASSWORD_REGEX}
          VALID_LAST_NAME_REGEX = /\A[ぁ-んァ-ン一-龥々ー]+\z/
          validates :last_name, format: { with: VALID_LAST_NAME_REGEX}
          VALID_FIRST_NAME_REGEX = /\A[ぁ-んァ-ン一-龥々ー]+\z/
          validates :first_name, format: { with: VALID_FIRST_NAME_REGEX}
          VALID_LAST_READ_NAME_REGEX = /\A[ァ-ヶー－]+\z/
          validates :last_read_name, format: { with: VALID_LAST_READ_NAME_REGEX}
          VALID_FIRST_READ_NAME_REGEX = /\A[ァ-ヶー－]+\z/
          validates :first_read_name, format: { with: VALID_FIRST_READ_NAME_REGEX}
end
