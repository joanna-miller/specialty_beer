require 'rails_helper'

describe "the search a product process" do
  it "searches for a product by name" do
    new_beer = Product.new({name: "Unreal Beer", brand: "Dogfish Head", cost: "10.99", country_of_origin: "USA"})
    new_beer.save
    new_beer2 = Product.new({name: "Fake Beer", brand: "Sam Adams", cost: "10.99", country_of_origin: "USA"})
    visit products_path
    fill_in 'beer_search', :with => 'Fake Beer'
    click_on 'Search by Beer'
    expect(page).not_to have_content 'Unreal Beer'
  end

  it "searches for a product by brand" do
    new_beer = Product.new({name: "Unreal Beer", brand: "Dogfish Head", cost: "10.99", country_of_origin: "USA"})
    new_beer.save
    new_beer2 = Product.new({name: "Fake Beer", brand: "Sam Adams", cost: "10.99", country_of_origin: "USA"})
    visit products_path
    fill_in 'brand_search', :with => 'Sam Adams'
    click_on 'Search by Brand'
    expect(page).not_to have_content 'Dogfish Head'
  end
end