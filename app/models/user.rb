class User < ApplicationRecord

  has_secure_password

  has_many :user_interests
  has_many :interests, through: :user_interests

  validates_presence_of :name, :email, :password
  validates_uniqueness_of :email

  enum role: ['default','mentee','mentor','admin']

  def new
    @user = User.new
  end

  def create
    binding.pry
  end

end
