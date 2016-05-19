class Review < ActiveRecord::Base
  belongs_to :product

  validates :review, presence: true, length: { minimum: 10 }
  validates :rating, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5 }
end
