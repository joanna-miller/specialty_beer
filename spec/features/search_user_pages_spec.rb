require 'rails_helper'

describe "the search a user process" do
  it "searches for a user by email" do
    user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password", birth_date: "1990/06/18", admin: true)
    user2 = User.create(email: 'user@test.com', password: "password", password_confirmation: "password", birth_date: "1990/06/18", admin: false)
    sign_in user
    visit users_path
    fill_in 'user_search', :with => 'test@test.com'
    click_on 'Search by email'
    expect(page).not_to have_content 'User Email: user@test.com'
  end
end