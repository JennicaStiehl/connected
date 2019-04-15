class Admin::UsersController < Admin::BaseController

  def show
    @user = User.find(params[:id])
  end

  def upgrade
    user = User.find(params[:id])
    user.update(role: :mentor)
    flash[:success] = "#{user.name} is now a mentor."
    redirect_to admin_mentor_path(user)
  end

end
