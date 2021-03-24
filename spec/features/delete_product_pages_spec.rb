require 'rails_helper'

describe "the delete a product process" do
  it "deletes a product" do
    new_beer = Product.new({name: "Unreal Beer", brand: "Dogfish Head", cost: "10.99", country_of_origin: "USA"})
    new_beer.save
    visit product_path(new_beer)
    click_link 'Edit Beer'
    click_on 'Delete Beer'
    expect(page).not_to have_content 'Unreal Beer'
  end
end