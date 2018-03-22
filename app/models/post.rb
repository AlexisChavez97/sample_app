class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :picture
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, length: { maximum: 140 }
  validates :picture, presence: true, if: Proc.new { |post| post.content.blank? }
  validates :content, presence: true, unless: Proc.new { |post| post.picture.attached? }
end
