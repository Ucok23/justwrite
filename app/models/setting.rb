class Setting < ApplicationRecord
  validate :only_one_record, on: :create

  def self.instance
    first_or_create!
  end

  private

  def only_one_record
    errors.add(:base, "There can only be one settings record.") if Setting.count.positive?
  end
end
