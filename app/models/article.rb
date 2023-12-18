class Article < ApplicationRecord
  validates :title, :link, :source, :extract, presence: true
end
