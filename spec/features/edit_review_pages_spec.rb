require 'rails_helper'

describe "the edit a review process" do
  it "edits an existing review" do
    new_beer = Product.new({name: "Totally Fake Beer", brand: "Dogfish Head", cost: "10.99", country_of_origin: "USA"})
    new_beer.save
    review = Review.new({author: "Jo Miller", content_body: "Sequi sed eum. Illo occaecati omnis. Repellendus accusantium enim." , rating: 5, product_id: new_beer.id })
    review.save
    user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password", birth_date: "1990/06/18", admin: true)
    sign_in user
    visit reviews_path
    click_link 'Edit Review by Jo Miller'
    fill_in 'Author', :with => 'JoAnna Miller'
    click_on 'Update Review'
    expect(page).to have_content 'JoAnna Miller'
  end
end