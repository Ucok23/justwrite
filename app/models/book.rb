class Book < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  has_one_attached :cover_image
  has_many :chapters, dependent: :destroy

  def to_param
    slug
  end
end
