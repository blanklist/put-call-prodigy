class RobotsController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
    robot = Robot.find_by(user_id: params[:user_id])
    if robot.update(name: params[:name])
      redirect_to equities_path
    else
      render 'edit'
    end
  end

end
