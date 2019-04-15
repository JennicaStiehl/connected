require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many :user_interests}
    it { should have_many(:interests).through(:user_interests) }
  end
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password }
  end

  describe 'roles' do
    it 'can be created as a default user' do
      user = User.create(
        email: "email",
        password: "password",
        name: "name",
        address: "address",
        city: "city",
        state: "state",
        zip: "zip"
      )
      expect(user.role).to eq('default')
      expect(user.default?).to be_truthy
    end

    it 'can be created as an admin' do
      user = User.create(
        email: "email",
        password: "password",
        name: "name",
        address: "address",
        city: "city",
        state: "state",
        zip: "zip",
        role: 3
      )
      expect(user.role).to eq('admin')
      expect(user.admin?).to be_truthy
    end

      it 'can be created as an mentee' do
        user = User.create(
          email: "email",
          password: "password",
          name: "name",
          address: "address",
          city: "city",
          state: "state",
          zip: "zip",
          role: 1
        )
        expect(user.role).to eq('mentee')
        expect(user.mentee?).to be_truthy
      end
      it 'can be created as an mentor' do
        user = User.create(
          email: "email",
          password: "password",
          name: "name",
          address: "address",
          city: "city",
          state: "state",
          zip: "zip",
          role: 2
        )
        expect(user.role).to eq('mentor')
        expect(user.mentor?).to be_truthy
      end
    end
end
