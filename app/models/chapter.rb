class Chapter < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :scoped, scope: :book

  belongs_to :book

  before_save :calculate_word_count
  before_create :set_position_and_status

  def to_param
    slug
  end

  private

  def calculate_word_count
    self.word_count = content.split.size
  end

  def set_position_and_status
    self.position ||= (book.chapters.maximum(:position) || 0) + 1
    self.status ||= "Draft"
  end
end
