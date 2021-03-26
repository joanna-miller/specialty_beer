require 'rails_helper'

describe "birthday validate process" do
  it "validates a users age is above 21" do
    visit root_path
    click_link 'sign up' 
    fill_in 'user_email', :with => 'email@email.com'
    fill_in 'user_birth_date', :with => '2000/06/18'
    fill_in 'user_password', :with => 'Password'
    fill_in 'user_password_confirmation', :with => 'Password'
    click_on 'Sign up'
    expect(page).to have_content 'You must be over 21 years old to browse this site.'
  end
end