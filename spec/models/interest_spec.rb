require 'rails_helper'

RSpec.describe Interest, type: :model do
  describe 'relationships' do
    it { should have_many :user_interests}
    it { should have_many(:users).through(:user_interests) }
  end
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
