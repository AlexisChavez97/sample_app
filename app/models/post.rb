class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :picture
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, length: { maximum: 140 }
end

