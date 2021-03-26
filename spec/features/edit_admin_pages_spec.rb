require 'rails_helper'

describe "the edit admin status process" do
  it "edits an existing users admin status" do
    user = User.create(email: 'notadmin@test.com', password: "password", password_confirmation: "password", birth_date: "1990/06/18", admin: false)
    admin = User.create(email: 'test@test.com', password: "password", password_confirmation: "password", birth_date: "1990/06/18", admin: true)
    sign_in admin
    visit users_path
    click_link 'Change Admin Status', match: :first
    choose option: 'true'
    click_on 'Update User'
    expect(page).not_to have_content 'Admin Status: false'
  end
end