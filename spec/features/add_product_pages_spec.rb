require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    visit '/'
    click_link 'Go to Full Beer List'
    click_link 'Add a New Beer'
    fill_in 'Name', :with => '60 Minute IPA'
    fill_in 'Brand', :with => 'Dogfish Head'
    fill_in 'Cost', :with => '10.99'
    fill_in 'Country of origin', :with => 'USA'
    click_on 'Create Product'
    expect(page).to have_content 'Dogfish Head: 60 Minute IPA'
  end

  it "gives an error when any field is left blank" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Cost can't be blank"
    expect(page).to have_content "Country of origin can't be blank"
    expect(page).to have_content "Brand can't be blank"
  end
end