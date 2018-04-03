class Meme < ApplicationRecord
  belongs_to :user
  has_many :categories
  has_one_attached :picture
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :caption, presence: true, length: { maximum: 999 }
  validate :picture_present?
  validates :name, presence: true, length: { maximum: 30 }


  def picture_present?
    errors.add(:picture, "Can't be blank") unless picture.attached?
  end
end
