require 'rails_helper'
RSpec.describe 'as a visitor' do
  describe 'i can register' do
    it 'can create a new user record' do
      email = "j@gmail.com"
      password = "pward"
      name = "jim"

      visit root_path
      click_on "Register as a new user"
      expect(current_path).to eq(new_user_path)
      # save_and_open_page
      fill_in :Name, with: name
      fill_in :Email, with: email
      fill_in :Password, with: password

      click_on "Register"

      user = User.last
      expect(current_path).to eq(root_path)
      expect(page).to have_content("Welcome, #{user.name}!")
    end
  end
  describe 'i can log out' do
    it 'and get redirected' do
      user = User.create(name:"jill", email: "jill@stuff.com", password: "stuff")
    end
  end
end
