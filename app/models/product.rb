class Product < ApplicationRecord
  validates :name, presence: true
  scope :published, -> { where(published: true) }

  def word_count
    name.split(' ').length
  end
end
