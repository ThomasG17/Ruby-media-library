class UsersController < ActionController::Base
  layout 'application'

  def list_locations
    @user_id = params[:id]
    @user = User.find(@user_id)
    @locations = @user.locations.where(back: false)
  end
end
