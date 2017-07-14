class RobotsController < ApplicationController

  def edit
    @user = User.find(params[:id])
    @robot = @user.robot
  end

  def update
    p "*" * 100
    p
    @robot = Robot.find_by(user_id: params[:user_id])
    if @robot.update(name: params[:name])
      redirect_to equities_path
    else
      render 'edit'
    end
  end

end
