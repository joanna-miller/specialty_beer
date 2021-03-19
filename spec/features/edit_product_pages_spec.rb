require 'rails_helper'

describe "the edit a product process" do
  it "edits an existing product" do
    new_beer = Product.new({name: "Totally Fake Beer", brand: "Dogfish Head", cost: "10.99", country_of_origin: "USA"})
    new_beer.save
    visit product_path(new_beer)
    click_link 'Edit Beer'
    fill_in 'Name', :with => 'Another Fake Beer'
    click_on 'Update Product'
    expect(page).to have_content 'Another Fake Beer'
  end
end