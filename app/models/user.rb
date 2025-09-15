class User < ApplicationRecord

  has_secure_password

  enum user_type: { adopter: 0, organization: 1, admin: 2 }

  has_many :organizations, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 6 }, on: :create
end
