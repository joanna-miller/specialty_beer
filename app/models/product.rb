class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates_uniqueness_of :name, case_sensitive: false
  validates :cost, presence: true
  validates :country_of_origin, presence: true
  validates :brand, presence: true
  before_save(:titleize_product)

  private
    def titleize_product
      self.name = self.name.titleize
      self.country_of_origin = self.country_of_origin.titleize
      self.brand = self.brand.titleize
    end
end