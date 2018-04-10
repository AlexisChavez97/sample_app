class Category < ApplicationRecord
  has_and_belongs_to_many :memes
  validates :name, presence: true, length: { maximum: 15 }
  # validates :color, presence: true
end
