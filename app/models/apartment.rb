class Apartment < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, :address, :description, presence: true
  validates :name, uniqueness: true
end
