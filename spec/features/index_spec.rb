require 'rails_helper'

RSpec.describe "as a visitor" do
  describe "when i visit the index page, i see all of the types of interests" do
    it "shows people and their interests" do
      @interest_1 = Interest.create(name: "running")
      @interest_2 = Interest.create(name: "spanish")
      @person_1 = User.create(name: "Joe", city: "Denver", state: "CO", zip: 80209)
      @person_2 = User.create(name: "Jane", city: "Denver", state: "CO", zip: 80209)
      @person_3 = User.create(name: "Josh", city: "Denver", state: "CO", zip: 80209)
      @person_1 = User.create!(name: "Jim", city: "Denver", state: "CO", zip: 80209)
      create(:user_interest, user: @person_1, interest: @interest_2, created_at: (rng.rand(3)+1).days.ago, updated_at: rng.rand(59).minutes.ago)
      create(:user_interest, user: @person_2, interest: @interest_1, created_at: (rng.rand(3)+1).days.ago, updated_at: rng.rand(59).minutes.ago)
      create(:user_interest, user: @person_3, interest: @interest_2, created_at: (rng.rand(3)+1).days.ago, updated_at: rng.rand(59).minutes.ago)

      visit persons_path
      expect(page).to have_content(@person_1.name)
      expect(page).to have_content(@person_2.name)
      expect(page).to have_content(@person_3.name)
      expect(page).to have_content(@person_1.interests)
      expect(page).to have_content(@person_2.interests)
      expect(page).to have_content(@person_3.interests)
    end
  end
end
