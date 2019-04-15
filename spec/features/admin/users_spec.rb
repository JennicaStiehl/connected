require 'rails_helper'

RSpec.describe "admin users workflow" do
  before :each do
    @user = User.create(name: "Joe", city: "Denver", state: "CO", zip: 80209, password:"pw", email:"1v@gmail.com", role:0)
    @admin = User.create(name: "Jane", city: "Denver", state: "CO", zip: 80209, password:"pw", email:"2v@gmail.com", role:3)
    visit login_path
  end

  context "as an admin" do
    it "can upgrade a user to a mentor" do
      fill_in :email, with: @admin.email
      fill_in :password, with: @admin.password

      click_on "Log in"
      visit admin_user_path(@user)

      click_on "Upgrade User to Mentor"

      expect(current_path).to eq(admin_mentor_path(@user))
      expect(page).to have_content("#{@user.name} is now a mentor.")

      click_link "Log out"
      fill_in :email, with: @admin.email
      fill_in :password, with: @admin.password

      click_on "Log in"
      visit dashboard_path
      expect(page).to have_content("Mentor Dashboard")
    end
  end

  context "as a non admin" do
    it "cannot reach the page" do
      fill_in :email, with: @user.email
      fill_in :password, with: @user.password

      click_on "Log in"
      visit admin_user_path(@user)
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
