require 'rails_helper'

describe Product do
  it { should have_many(:reviews) }
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of(:name).on(:create).case_insensitive }
  it { should validate_presence_of :cost }
  it { should validate_presence_of :country_of_origin }
  it { should validate_presence_of :brand }
  it('titleizes the name of a product') do
    beer = Product.create({name: "fake beer", brand: "Dogfish Head", cost: "10.99", country_of_origin: "USA"})
    expect(beer.name()).to(eq('Fake Beer'))
  end
end