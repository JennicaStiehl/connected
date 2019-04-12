class InterestsController < ApplicationController
  def index
    @interests = Interest.all
    # @cart = Cart.new
  end


end
