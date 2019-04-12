class CartsController < ApplicationController
  def create
    @interest = Interest.find(params[:interest_id])

    flash[:notice] = "You have 1 interest in your cart"
    redirect_to interests_path
  end
end
