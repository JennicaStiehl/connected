require 'rails_helper'
RSpec.describe 'as a visitor' do
  describe 'i can shop and' do
    xit 'i see a button that adds to the cart' do
      interest = Interest.create!(name: "soccer")
      visit interests_path
      click_button "Add Interest"
      expect(page).to have_content("You have 1 interest in your cart")

      click_on "Add Interest"
      expect(page).to have_content("You have 2 interests in your cart")

    end
    xit "the total number of interests in the cart increments" do
      interest = Interest.create!(name: "soccer")

      visit interests_path

      expect(page).to have_content("Cart: 0")

      click_button "Add Interest"

      expect(page).to have_content("Cart: 1")
    end
  end
end
