class EquitiesController < ApplicationController
	include ContractsHelper

	def show
		if logged_in?
      @user = current_user
      @contracts = current_user.contracts
			@contract = Contract.new
	    @current_time = Time.now.in_time_zone("Pacific Time (US & Canada)").to_s.split(" ").second
			@equity = Equity.find_by(id: params[:id])
      p params
    else
      redirect_to new_user_path
    end
	end

	def delete
		Equity.delete(:id)
	end

end
