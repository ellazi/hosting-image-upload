class Visit < ApplicationRecord
  belongs_to :user
  belongs_to :apartment

  validates :date, presence: true
end
