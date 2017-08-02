class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      respond_to do |format|
        format.html
        format.js
      redirect_to edit_user_robot_path(@user, @user.robot)
      # flash[:notice] = "You signed up successfully"

      end
    else
      flash[:notice] = "Form is invalid"
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @contracts = @user.contracts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
