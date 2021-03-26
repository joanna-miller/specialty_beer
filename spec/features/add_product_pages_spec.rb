require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password", birth_date: "1990/06/18", admin: true)
    sign_in user
    visit '/'
    click_link 'e n t e r'
    click_link 'Add a New Beer'
    fill_in 'Name', :with => 'Unreal Beer'
    fill_in 'Brand', :with => 'Dogfish Head'
    fill_in 'Cost', :with => '10.99'
    fill_in 'Country of origin', :with => 'USA'
    click_on 'Create Product'
    expect(page).to have_content 'Unreal Beer'
  end

  it "gives an error when any field is left blank" do
    user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password", birth_date: "1990/06/18", admin: true)
    sign_in user
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Cost can't be blank"
    expect(page).to have_content "Country of origin can't be blank"
    expect(page).to have_content "Brand can't be blank"
  end
end