class UserInterest < ApplicationRecord
  belongs_to :user
  belongs_to :interest
  validates_presence_of :name
end
