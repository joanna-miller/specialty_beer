class Review < ApplicationRecord
  belongs_to :product
  validates :author, presence: true 
  validates :content_body, presence: true 
  validates_length_of :content_body, minimum: 50, maximum: 250
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end