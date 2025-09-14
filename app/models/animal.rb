class Animal < ApplicationRecord
  validates :name, presence: true
  validates :specie, presence: true
  validates :status, presence: true
end
