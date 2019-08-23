require 'rails_helper'

RSpec.describe "the login page" do
  before :each do
    @user = User.create(name: "Joe", city: "Denver", state: "CO", zip: 80209, password:"pw", email:"1v@gmail.com", role:0)
    @admin = User.create(name: "Jane", city: "Denver", state: "CO", zip: 80209, password:"pw", email:"2v@gmail.com", role:3)
    visit login_path
  end

  it "can login a regular user" do
    fill_in :email, with: @user.email
    fill_in :password, with: @user.password

    click_button "Log in"
    expect(current_path).to eq(root_path)

    expect(page).to have_content("You are now logged in!")
  end

  it "can login an admin" do
    fill_in :email, with: @admin.email
    fill_in :password, with: @admin.password

    click_button "Log in"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("You are now logged in!")
  end
end
