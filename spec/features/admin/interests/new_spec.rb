require 'rails_helper'
RSpec.describe 'as an admin', type: :feature do
  describe 'i can create new interests' do
    it 'and regular users cannot' do
      # admin = User.create(name:"admin", city:"Denver", state:"CO", zip:80209, email:"admin@gmail.com", password:"password")
      name = "Knitting"

      visit root_path
      click_on "Create New Interest"
      expect(current_path).to eq(new_admin_interest_path)
      
      fill_in "Name", with: name
      click_on "Create Interest"
      expect(current_path).to eq(interests_path)
      expect(page).to have_content("Knitting")
    end
  end
end
