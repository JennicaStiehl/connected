class Admin::InterestsController < ApplicationController
#require a user is an admin in order to get to this controller
#
  def new
    @interest = Interest.new
  end

  def create
    interest = Interest.new(name: params[:interest][:name])
    if interest.save
      redirect_to interests_path
    else
      render :new
    end
  end


end
