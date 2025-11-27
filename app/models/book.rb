class Book < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :chapters, dependent: :destroy

  def to_param
    slug
  end
end
