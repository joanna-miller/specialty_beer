require 'rails_helper'

describe "the delete a review process" do
  it "deletes a review" do
    new_beer = Product.new({name: "Totally Fake Beer", brand: "Dogfish Head", cost: "10.99", country_of_origin: "USA"})
    new_beer.save
    review = Review.new({author: "Jo Miller", content_body: "Sequi sed eum. Illo occaecati omnis. Repellendus accusantium enim." , rating: 5, product_id: new_beer.id })
    review.save
    visit reviews_path
    click_link 'Edit Review by Jo Miller'
    click_link 'Delete Review'
    expect(page).not_to have_content 'Jo Miller'
  end
end