require 'rails_helper'

RSpec.describe "as a visitor" do
  describe "when i visit the index page, i see all of the types of interests" do
    it "shows people and their interests" do
      Random.new_seed
      @rng = Random.new
      @person_1 = User.create(name: "Joe", city: "Denver", state: "CO", zip: 80209, password:"pw", email:"1@gmail.com")
      @person_2 = User.create(name: "Jane", city: "Denver", state: "CO", zip: 80209, password:"pw", email:"2@gmail.com")
      @person_3 = User.create(name: "Josh", city: "Denver", state: "CO", zip: 80209, password:"pw", email:"3@gmail.com")
      @person_4 = User.create!(name: "Jim", city: "Denver", state: "CO", zip: 80209, password:"pw", email:"4@gmail.com")
      @interest_1 = @person_1.interests.create(name: "running")
      @interest_2 = @person_1.interests.create(name: "spanish")
      @interest_3 = @person_1.interests.create(name: "cycling")
      @ui_1 = UserInterest.create(user: @person_1, interest: @interest_2, created_at: (@rng.rand(3)+1).days.ago, updated_at: @rng.rand(59).minutes.ago)
      @ui_2 = UserInterest.create(user: @person_2, interest: @interest_1, created_at: (@rng.rand(3)+1).days.ago, updated_at: @rng.rand(59).minutes.ago)
      @ui_3 = UserInterest.create(user: @person_3, interest: @interest_2, created_at: (@rng.rand(3)+1).days.ago, updated_at: @rng.rand(59).minutes.ago)

      visit users_path
      expect(page).to have_content(@person_1.name)
      expect(page).to have_content(@person_2.name)
      expect(page).to have_content(@person_3.name)
      expect(page).to have_content(@interest_1.name)
      expect(page).to have_content(@interest_2.name)
      expect(page).to have_content(@interest_3.name)
    end
  end
end
