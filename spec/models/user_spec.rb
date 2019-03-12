require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many :user_interests}
    it { should have_many(:interests).through(:user_interests) }
  end
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

end
