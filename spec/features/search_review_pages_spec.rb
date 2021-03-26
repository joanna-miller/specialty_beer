require 'rails_helper'

describe "the search a review process" do
  it "searches for a review by author" do
    new_beer = Product.new({name: "Totally Fake Beer", brand: "Dogfish Head", cost: "10.99", country_of_origin: "USA"})
    new_beer.save
    review = Review.new({author: "Jo Miller", content_body: "Sequi sed eum. Illo occaecati omnis. Repellendus accusantium enim." , rating: 5, product_id: new_beer.id })
    review.save
    review2 = Review.new({author: "Other Reviewer", content_body: "Sequi sed eum. Illo occaecati omnis. Repellendus accusantium enim." , rating: 5, product_id: new_beer.id })
    review2.save
    visit reviews_path
    fill_in 'author_search', :with => 'Jo Miller'
    click_on 'Search by Author'
    expect(page).not_to have_content 'Other Reviewer'
  end
end