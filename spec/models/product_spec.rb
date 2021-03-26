require 'rails_helper'

describe Product do
  context 'validations' do
    it { should have_many(:reviews) }
    it { should validate_presence_of :name }
    it { should validate_presence_of :cost }
    it { should validate_presence_of :country_of_origin }
    it { should validate_presence_of :brand }
  end
  
  context 'name validation' do
    subject { Product.new({name: "A Fake Beer", brand: "dogfish head", cost: "10.99", country_of_origin: "united states"}) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  context 'callbacks' do
    it('titleizes the name of a product') do
      beer = Product.create({name: "a fake beer", brand: "dogfish head", cost: "10.99", country_of_origin: "united states"})
      expect(beer.name).to(eq('A Fake Beer'))
      expect(beer.country_of_origin).to(eq('United States'))
      expect(beer.brand).to(eq('Dogfish Head'))
    end
  end
end