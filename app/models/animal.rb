class Animal < ApplicationRecord
  validates :name, presence: true
  validates :specie, presence: true
  validates :status, presence: true

  belongs_to :organization, optional: true
  has_many :adoptions, dependent: :destroy
end
