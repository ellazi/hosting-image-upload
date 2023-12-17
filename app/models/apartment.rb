class Apartment < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :visits
  has_one_attached :photo
  belongs_to :user

  validates :name, :address, :description, presence: true
  validates :name, uniqueness: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
