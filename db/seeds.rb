# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@person_1 = User.create!(name: "Jim")
@interest_2 = @person_1.interests.create!(name: "spanish")
create(:user_interest, user: @person_1, interest: @interest_2, created_at: (rng.rand(3)+1).days.ago, updated_at: rng.rand(59).minutes.ago)

# @person = @interest_1.users.create(name: "Joe")
# @person_1 = User.create!(name: "Joe", interest: [@interest_1, @interest_2])
# @person_2 = User.create!(name: "Jane", interest: [@interest_2])
# @person_3 = User.create!(name: "Josh", interest: [@interest_1])
