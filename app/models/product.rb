class Product < ActiveRecord::Base
  has_many :reviews

  validates :title, presence: true, length: { minimum: 5 }
  validates :sku, presence: true, length: { minimum: 3 }
  validates :price, presence: true, numericality: { only_integer: true }
end
