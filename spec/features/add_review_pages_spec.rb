require 'rails_helper'

describe "the add a review process" do
  it "adds a new review" do
    new_beer = Product.new({name: "Fake Beer", brand: "Dogfish Head", cost: "10.99", country_of_origin: "USA"})
    new_beer.save
    visit product_path(new_beer)
    click_link 'Leave a Review'
    fill_in 'review_author', :with => 'Jo Miller'
    fill_in 'review_content_body', :with => 'Lorem ipsum dolor sit amet, consectetuer adipiscing'
    fill_in 'review_rating', :with => '5'
    click_on 'Create Review'
    expect(page).to have_content 'Written by: Jo Miller'
  end

  it "gives an error when any field is left blank" do
    new_beer = Product.new({name: "Fake Beer", brand: "Dogfish Head", cost: "10.99", country_of_origin: "USA"})
    new_beer.save
    visit product_path(new_beer)
    click_on 'Leave a Review'
    click_on 'Create Review'
    expect(page).to have_content "Author can't be blank"
    expect(page).to have_content "Content body can't be blank"
    expect(page).to have_content "Rating can't be blank"
  end
end