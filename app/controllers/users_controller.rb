
class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.password == @user.password_confirmation && @user.save
        session[:user_id] = @user.id
        # UserMailer.welcome_email(@user).deliver_later
        redirect_to '/'
      else
        redirect_to '/user/new'
      end
  end

  def show
    @current_user = Users.find params[session[:user_id]]
    @review = Review.new
    @review.user = @current_user
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

end